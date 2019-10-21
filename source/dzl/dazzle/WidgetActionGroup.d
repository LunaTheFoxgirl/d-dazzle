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
module dazzle.WidgetActionGroup;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ActionGroupIF;
private import gio.ActionGroupT;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Widget;


/** */
public class WidgetActionGroup : ObjectG, ActionGroupIF
{
	/** the main Gtk struct */
	protected DzlWidgetActionGroup* dzlWidgetActionGroup;

	/** Get the main Gtk struct */
	public DzlWidgetActionGroup* getWidgetActionGroupStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlWidgetActionGroup;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlWidgetActionGroup;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlWidgetActionGroup* dzlWidgetActionGroup, bool ownedRef = false)
	{
		this.dzlWidgetActionGroup = dzlWidgetActionGroup;
		super(cast(GObject*)dzlWidgetActionGroup, ownedRef);
	}

	// add the ActionGroup capabilities
	mixin ActionGroupT!(DzlWidgetActionGroup);


	/** */
	public static GType getType()
	{
		return dzl_widget_action_group_get_type();
	}

	/**
	 * Helper function to create an #DzlWidgetActionGroup and attach
	 * it to @widget using the group name @group_name.
	 *
	 * Params:
	 *     widget = A #GtkWidget
	 *     groupName = the group name to use for the action group
	 */
	public static void attach(Widget widget, string groupName)
	{
		dzl_widget_action_group_attach((widget is null) ? null : widget.getWidgetStruct(), Str.toStringz(groupName));
	}

	/**
	 * Returns: An #DzlWidgetActionGroup.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(Widget widget)
	{
		auto p = dzl_widget_action_group_new((widget is null) ? null : widget.getWidgetStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlWidgetActionGroup*) p, true);
	}

	/** */
	public void setActionEnabled(string actionName, bool enabled)
	{
		dzl_widget_action_group_set_action_enabled(dzlWidgetActionGroup, Str.toStringz(actionName), enabled);
	}
}
