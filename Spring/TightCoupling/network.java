package Spring.TightCoupling;

public class network {
    airtel a_sim = new airtel(); // Tight Coupling
    mobilesim new_sim = new vi(); // Half Coupling

    network() {

        try {
            new_sim.sim();

        } catch (Exception e) {
            System.err.println("INSERT NEW SIM CARD");
        }

    }
}
