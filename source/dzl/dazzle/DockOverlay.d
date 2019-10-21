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
module dazzle.DockOverlay;

private import dazzle.DockIF;
private import dazzle.DockItemIF;
private import dazzle.DockItemT;
private import dazzle.DockOverlayEdge;
private import dazzle.DockT;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Adjustment;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.EventBox;
private import gtk.Widget;
private import std.algorithm;


/** */
public class DockOverlay : EventBox, DockIF, DockItemIF
{
	/** the main Gtk struct */
	protected DzlDockOverlay* dzlDockOverlay;

	/** Get the main Gtk struct */
	public DzlDockOverlay* getDockOverlayStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDockOverlay;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDockOverlay;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDockOverlay* dzlDockOverlay, bool ownedRef = false)
	{
		this.dzlDockOverlay = dzlDockOverlay;
		super(cast(GtkEventBox*)dzlDockOverlay, ownedRef);
	}

	// add the Dock capabilities
	mixin DockT!(DzlDockOverlay);

	// add the DockItem capabilities
	mixin DockItemT!(DzlDockOverlay);

	alias getParent = Widget.getParent;

	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_dock_overlay_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_dock_overlay_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlDockOverlay*) p);
	}

	/**
	 *
	 * Params:
	 *     position = the edge position.
	 * Returns: The corresponding #DzlDockOverlayEdge.
	 */
	public DockOverlayEdge getEdge(GtkPositionType position)
	{
		auto p = dzl_dock_overlay_get_edge(dzlDockOverlay, position);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(DockOverlayEdge)(cast(DzlDockOverlayEdge*) p);
	}

	/**
	 *
	 * Params:
	 *     position = the edge position.
	 * Returns: The corresponding #GtkAdjustment.
	 */
	public Adjustment getEdgeAdjustment(GtkPositionType position)
	{
		auto p = dzl_dock_overlay_get_edge_adjustment(dzlDockOverlay, position);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Adjustment)(cast(GtkAdjustment*) p);
	}

	/** */
	gulong addOnHideEdges(void delegate(DockOverlay) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "hide-edges", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
