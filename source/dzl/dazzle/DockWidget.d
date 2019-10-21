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
module dazzle.DockWidget;

private import dazzle.Bin;
private import dazzle.DockItemIF;
private import dazzle.DockItemT;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.IconIF;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Widget;


/** */
public class DockWidget : Bin, DockItemIF
{
	/** the main Gtk struct */
	protected DzlDockWidget* dzlDockWidget;

	/** Get the main Gtk struct */
	public DzlDockWidget* getDockWidgetStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDockWidget;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDockWidget;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDockWidget* dzlDockWidget, bool ownedRef = false)
	{
		this.dzlDockWidget = dzlDockWidget;
		super(cast(DzlBin*)dzlDockWidget, ownedRef);
	}

	// add the DockItem capabilities
	mixin DockItemT!(DzlDockWidget);

	alias getParent = Widget.getParent;

	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_dock_widget_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_dock_widget_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlDockWidget*) p);
	}

	/** */
	public void setGicon(IconIF gicon)
	{
		dzl_dock_widget_set_gicon(dzlDockWidget, (gicon is null) ? null : gicon.getIconStruct());
	}

	/** */
	public void setIconName(string iconName)
	{
		dzl_dock_widget_set_icon_name(dzlDockWidget, Str.toStringz(iconName));
	}

	/** */
	public void setTitle(string title)
	{
		dzl_dock_widget_set_title(dzlDockWidget, Str.toStringz(title));
	}
}
