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
module dazzle.Tab;

private import dazzle.Bin;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.IconIF;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.ActionableIF;
private import gtk.ActionableT;
private import gtk.Widget;
private import std.algorithm;


/** */
public class Tab : Bin, ActionableIF
{
	/** the main Gtk struct */
	protected DzlTab* dzlTab;

	/** Get the main Gtk struct */
	public DzlTab* getTabStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlTab;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlTab;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlTab* dzlTab, bool ownedRef = false)
	{
		this.dzlTab = dzlTab;
		super(cast(DzlBin*)dzlTab, ownedRef);
	}

	// add the Actionable capabilities
	mixin ActionableT!(DzlTab);

	alias getStyle = Widget.getStyle;

	/** */
	public DzlTabStyle getStyle()
	{
		return dzl_tab_get_style(dzlTab);
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_tab_get_type();
	}

	/** */
	public bool getActive()
	{
		return dzl_tab_get_active(dzlTab) != 0;
	}

	/** */
	public bool getCanClose()
	{
		return dzl_tab_get_can_close(dzlTab) != 0;
	}

	/** */
	public GtkPositionType getEdge()
	{
		return dzl_tab_get_edge(dzlTab);
	}

	/** */
	public string getIconName()
	{
		return Str.toString(dzl_tab_get_icon_name(dzlTab));
	}

	/** */
	public string getTitle()
	{
		return Str.toString(dzl_tab_get_title(dzlTab));
	}

	/**
	 * Returns: A #GtkWidget or %NULL.
	 */
	public Widget getWidget()
	{
		auto p = dzl_tab_get_widget(dzlTab);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/** */
	public void setActive(bool active)
	{
		dzl_tab_set_active(dzlTab, active);
	}

	/** */
	public void setCanClose(bool canClose)
	{
		dzl_tab_set_can_close(dzlTab, canClose);
	}

	/** */
	public void setEdge(GtkPositionType edge)
	{
		dzl_tab_set_edge(dzlTab, edge);
	}

	/** */
	public void setGicon(IconIF gicon)
	{
		dzl_tab_set_gicon(dzlTab, (gicon is null) ? null : gicon.getIconStruct());
	}

	/** */
	public void setIconName(string iconName)
	{
		dzl_tab_set_icon_name(dzlTab, Str.toStringz(iconName));
	}

	/** */
	public void setStyle(DzlTabStyle style)
	{
		dzl_tab_set_style(dzlTab, style);
	}

	/** */
	public void setTitle(string title)
	{
		dzl_tab_set_title(dzlTab, Str.toStringz(title));
	}

	/** */
	public void setWidget(Widget widget)
	{
		dzl_tab_set_widget(dzlTab, (widget is null) ? null : widget.getWidgetStruct());
	}

	/** */
	gulong addOnClicked(void delegate(Tab) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "clicked", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
