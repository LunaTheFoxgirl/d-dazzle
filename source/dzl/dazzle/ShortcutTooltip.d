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
module dazzle.ShortcutTooltip;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Widget;


/** */
public class ShortcutTooltip : ObjectG
{
	/** the main Gtk struct */
	protected DzlShortcutTooltip* dzlShortcutTooltip;

	/** Get the main Gtk struct */
	public DzlShortcutTooltip* getShortcutTooltipStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutTooltip;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutTooltip;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutTooltip* dzlShortcutTooltip, bool ownedRef = false)
	{
		this.dzlShortcutTooltip = dzlShortcutTooltip;
		super(cast(GObject*)dzlShortcutTooltip, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcut_tooltip_get_type();
	}

	/**
	 * Create a new #DzlShortcutTooltip.
	 *
	 * Returns: a newly created #DzlShortcutTooltip
	 *
	 * Since: 3.32
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = dzl_shortcut_tooltip_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlShortcutTooltip*) p, true);
	}

	/**
	 * Gets the #DzlShortcutTooltip:accel property, which can be used to override
	 * the commands accel.
	 *
	 * Returns: an override accel, or %NULL
	 *
	 * Since: 3.32
	 */
	public string getAccel()
	{
		return Str.toString(dzl_shortcut_tooltip_get_accel(dzlShortcutTooltip));
	}

	/**
	 * Gets the #DzlShortcutTooltip:command-id property.
	 *
	 * Returns: a string containing the command id
	 *
	 * Since: 3.32
	 */
	public string getCommandId()
	{
		return Str.toString(dzl_shortcut_tooltip_get_command_id(dzlShortcutTooltip));
	}

	/**
	 * Gets the #DzlShortcutTooltip:title property, if set.
	 *
	 * Returns: a string containing the title, or %NULL
	 *
	 * Since: 3.32
	 */
	public string getTitle()
	{
		return Str.toString(dzl_shortcut_tooltip_get_title(dzlShortcutTooltip));
	}

	/**
	 * Gets the #GtkWidget that the shortcut-tooltip is wrapping.
	 *
	 * Returns: a #GtkWidget or %NULL if unset
	 *
	 * Since: 3.32
	 */
	public Widget getWidget()
	{
		auto p = dzl_shortcut_tooltip_get_widget(dzlShortcutTooltip);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/**
	 * Allows overriding the accel that is used.
	 *
	 * Params:
	 *     accel = Sets the accelerator to use, or %NULL to unset
	 *         and use the default
	 *
	 * Since: 3.32
	 */
	public void setAccel(string accel)
	{
		dzl_shortcut_tooltip_set_accel(dzlShortcutTooltip, Str.toStringz(accel));
	}

	/**
	 * This sets the #DzlShortcutTooltip:command-id property which denotes which
	 * shortcut registered with libdazzle to display when a tooltip request is
	 * received.
	 *
	 * Params:
	 *     commandId = the command-id of the shortcut registered
	 *
	 * Since: 3.32
	 */
	public void setCommandId(string commandId)
	{
		dzl_shortcut_tooltip_set_command_id(dzlShortcutTooltip, Str.toStringz(commandId));
	}

	/**
	 * Sets the #DzlShortcutTooltip:title property, which can be used to
	 * override the default title for the tooltip as discovered from the
	 * shortcut manager.
	 *
	 * Params:
	 *     title = a title for the tooltip, or %NULL
	 *
	 * Since: 3.32
	 */
	public void setTitle(string title)
	{
		dzl_shortcut_tooltip_set_title(dzlShortcutTooltip, Str.toStringz(title));
	}

	/**
	 * Sets the widget to connect to the #GtkWidget::query-tooltip signal.
	 *
	 * If configured, the widget will be displayed with an appropriate tooltip
	 * message matching the shortcut from #DzlShortcutTooltip:command-id.
	 *
	 * Params:
	 *     widget = a #GtkWidget or %NULL
	 *
	 * Since: 3.32
	 */
	public void setWidget(Widget widget)
	{
		dzl_shortcut_tooltip_set_widget(dzlShortcutTooltip, (widget is null) ? null : widget.getWidgetStruct());
	}
}
