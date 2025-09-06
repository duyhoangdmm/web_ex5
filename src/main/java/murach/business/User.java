package murach.business;

import java.io.Serializable;

public class User implements Serializable {
    private String email;
    private String firstName;
    private String lastName;

    public User() {
        this.email = "";
        this.firstName = "";
        this.lastName = "";
    }

    public User(String email, String firstName, String lastName) {
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    // Getters and Setters
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
}