package vo;

public class user {
    public Integer id;
    public String username;
    public String password;

    public user(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public user() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
}
