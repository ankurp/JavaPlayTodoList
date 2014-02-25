package controllers;

import models.TodoItem;
import play.data.Form;
import play.db.ebean.Model;
import play.mvc.*;

import views.html.*;

import java.util.List;

import static play.libs.Json.toJson;

/**
 * Created by ankur on 2/25/14.
 */
public class TodoController extends Controller {

    public static Result index() {
        List<TodoItem> todos = new Model.Finder(String.class, TodoItem.class).all();
        return ok(toJson(todos));
    }

    public static Result create() {
        TodoItem todo = Form.form(TodoItem.class).bindFromRequest().get();
        todo.save();
        return created(toJson(todo));
    }

    public static Result delete(String id) {
        TodoItem todo = (TodoItem) new Model.Finder(String.class, TodoItem.class).byId(id);
        todo.delete();
        return ok();
    }

}
