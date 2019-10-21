/*
 * This file is part of d-dazzle.
 *
 * d-dazzle is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * d-dazzle is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with d-dazzle; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */
module dazzle.ChildPropertyAction;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ActionIF;
private import gio.ActionT;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Container;
private import gtk.Widget;


/** */
public class ChildPropertyAction : ObjectG, ActionIF
{
	/** the main Gtk struct */
	protected DzlChildPropertyAction* dzlChildPropertyAction;

	/** Get the main Gtk struct */
	public DzlChildPropertyAction* getChildPropertyActionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlChildPropertyAction;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlChildPropertyAction;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlChildPropertyAction* dzlChildPropertyAction, bool ownedRef = false)
	{
		this.dzlChildPropertyAction = dzlChildPropertyAction;
		super(cast(GObject*)dzlChildPropertyAction, ownedRef);
	}

	// add the Action capabilities
	mixin ActionT!(DzlChildPropertyAction);


	/** */
	public static GType getType()
	{
		return dzl_child_property_action_get_type();
	}

	/**
	 * This creates a new #GAction that will change when the underlying child
	 * property of @container changes for @child.
	 *
	 * Params:
	 *     name = the name of the action
	 *     container = the container of the widget
	 *     child = the widget for the child property
	 *     childPropertyName = the name of the child property
	 *
	 * Returns: A new #DzlChildPropertyAction.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string name, Container container, Widget child, string childPropertyName)
	{
		auto p = dzl_child_property_action_new(Str.toStringz(name), (container is null) ? null : container.getContainerStruct(), (child is null) ? null : child.getWidgetStruct(), Str.toStringz(childPropertyName));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlChildPropertyAction*) p, true);
	}
}
