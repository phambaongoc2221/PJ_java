package Entity;

public class Category {
    private int cID;
    private String cname;

    public Category() {
    }

    public Category(int cID, String cname) {
        this.cID = cID;
        this.cname = cname;
    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public String toString() {
        return "Category{" +
                "cID=" + cID +
                ", cname='" + cname + '\'' +
                '}';
    }
}
