package entity;

public class Admin {

    private Integer au_id;
    private String  username;
    private  String  password;

    public Integer getAu_id() {
        return au_id;
    }

    public void setAu_id(Integer au_id) {
        this.au_id = au_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "au_id=" + au_id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
