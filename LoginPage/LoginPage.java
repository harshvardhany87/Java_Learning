package LoginPage;

import javax.swing.*;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.*;

class LoginPage extends JFrame {

    JLabel label1, label2, label3, label4;
    JTextField text1, text2;
    JButton button1, button2, button3;
    JPasswordField passwordField;

    Font f1 = new Font("Times New Roman", Font.BOLD, 26);
    Font f2 = new Font("Arial", Font.PLAIN, 18);
    Font f3 = new Font("Arial", Font.BOLD, 12);

    LoginPage(String name) {
        super(name);
    }

    LoginPage() {
        setComponent();
    }

    void setComponent() {
        setLayout(null);

        label1 = new JLabel("Login Page");
        label1.setFont(f1);
        label1.setBounds(225, 50, 150, 30);
        add(label1);

        label2 = new JLabel("Username: ");
        label2.setFont(f2);
        label2.setBounds(110, 120, 150, 30);
        add(label2);

        label3 = new JLabel("Password: ");
        label3.setFont(f2);
        label3.setBounds(110, 180, 150, 30);
        add(label3);

        label4 = new JLabel();
        label4.setBounds(120, 300, 280, 25);
        add(label4);

        text1 = new JTextField();
        text1.setBounds(200, 120, 150, 30);
        add(text1);

        text2 = new JPasswordField();
        text2.setBounds(200, 180, 150, 30);
        add(text2);

        button1 = new JButton("Login");
        button1.setBounds(100, 250, 100, 30);
        add(button1);

        button2 = new JButton("Clear");
        button2.setBounds(200, 250, 100, 30);
        add(button2);

        button3 = new JButton("Autofill");
        button3.setBounds(300, 250, 100, 30);
        add(button3);

        button1.addActionListener(new Login());
        button2.addActionListener(new Clear());
        button3.addActionListener(new Autofill());

        // label1.addMouseListener(new MouseL());
        // label2.addMouseListener(new MouseL());
        // label3.addMouseListener(new MouseL());
        // label4.addMouseListener(new MouseL());
        // text1.addMouseListener(new MouseL());
        // text2.addMouseListener(new MouseL());
        button1.addMouseListener(new MouseL());
        button2.addMouseListener(new MouseL());
        button3.addMouseListener(new MouseL());

    }

    public static void main(String args[]) {
        LoginPage newFrame = new LoginPage("Login Page");
        newFrame.setSize(650, 550);
        newFrame.setVisible(true);
        newFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        newFrame.setComponent();
    }

    class Login implements ActionListener {
        public void actionPerformed(ActionEvent e1) {
            String name = text1.getText();
            String password = text2.getText();

            if (name.equals("Harsh") && password.equals("1234")) {
                JOptionPane.showMessageDialog(null, "Login Successfull: ");
            } else {
                JOptionPane.showMessageDialog(null, "Login Unsuccessful: ");
            }

        }

    }

    class Clear implements ActionListener {
        public void actionPerformed(ActionEvent e1) {
            text1.setText("");
            text2.setText("");
            label4.setText("");
        }

    }

    class Autofill implements ActionListener {
        public void actionPerformed(ActionEvent e1) {
            text1.setText("Harsh");
            text2.setText("1234");

        }

    }

    class MouseL implements MouseListener {
        public void mousePressed(MouseEvent e1) {
            JButton newButton = (JButton) e1.getSource();
            newButton.setForeground(Color.RED);

        }

        public void mouseEntered(MouseEvent e1) {

        }

        public void mouseReleased(MouseEvent e1) {
            JButton newButton = (JButton) e1.getSource();
            newButton.setForeground(Color.BLACK);

        }

        public void mouseClicked(MouseEvent e1) {

        }

        public void mouseExited(MouseEvent e1) {

        }
    }

}