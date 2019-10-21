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
module dazzle.DockBin;

private import dazzle.DockIF;
private import dazzle.DockItemIF;
private import dazzle.DockItemT;
private import dazzle.DockT;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Container;
private import gtk.Widget;


/** */
public class DockBin : Container, DockIF, DockItemIF
{
	/** the main Gtk struct */
	protected DzlDockBin* dzlDockBin;

	/** Get the main Gtk struct */
	public DzlDockBin* getDockBinStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDockBin;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDockBin;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDockBin* dzlDockBin, bool ownedRef = false)
	{
		this.dzlDockBin = dzlDockBin;
		super(cast(GtkContainer*)dzlDockBin, ownedRef);
	}

	// add the Dock capabilities
	mixin DockT!(DzlDockBin);

	// add the DockItem capabilities
	mixin DockItemT!(DzlDockBin);

	alias getParent = Widget.getParent;

	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_dock_bin_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_dock_bin_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlDockBin*) p);
	}

	/**
	 * Returns: A #GtkWidget
	 */
	public Widget getBottomEdge()
	{
		auto p = dzl_dock_bin_get_bottom_edge(dzlDockBin);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/**
	 * Gets the center widget for the dock.
	 *
	 * Returns: A #GtkWidget or %NULL.
	 */
	public Widget getCenterWidget()
	{
		auto p = dzl_dock_bin_get_center_widget(dzlDockBin);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/**
	 * Returns: A #GtkWidget
	 */
	public Widget getLeftEdge()
	{
		auto p = dzl_dock_bin_get_left_edge(dzlDockBin);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/**
	 * Returns: A #GtkWidget
	 */
	public Widget getRightEdge()
	{
		auto p = dzl_dock_bin_get_right_edge(dzlDockBin);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/**
	 * Returns: A #GtkWidget
	 */
	public Widget getTopEdge()
	{
		auto p = dzl_dock_bin_get_top_edge(dzlDockBin);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}
}
