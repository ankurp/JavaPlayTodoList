package models;

import play.db.ebean.Model;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by ankur on 2/25/14.
 */
@Entity
public class TodoItem extends Model {

    @Id
    public String id;

    public String text;

}
