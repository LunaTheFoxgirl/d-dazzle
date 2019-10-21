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
module dazzle.DockOverlayEdge;

private import dazzle.Bin;
private import dazzle.DockItemIF;
private import dazzle.DockItemT;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gtk.Widget;


/** */
public class DockOverlayEdge : Bin, DockItemIF
{
	/** the main Gtk struct */
	protected DzlDockOverlayEdge* dzlDockOverlayEdge;

	/** Get the main Gtk struct */
	public DzlDockOverlayEdge* getDockOverlayEdgeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDockOverlayEdge;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDockOverlayEdge;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDockOverlayEdge* dzlDockOverlayEdge, bool ownedRef = false)
	{
		this.dzlDockOverlayEdge = dzlDockOverlayEdge;
		super(cast(DzlBin*)dzlDockOverlayEdge, ownedRef);
	}

	// add the DockItem capabilities
	mixin DockItemT!(DzlDockOverlayEdge);

	alias getParent = Widget.getParent;

	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_dock_overlay_edge_get_type();
	}

	/** */
	public GtkPositionType getEdge()
	{
		return dzl_dock_overlay_edge_get_edge(dzlDockOverlayEdge);
	}

	/** */
	public int getPosition()
	{
		return dzl_dock_overlay_edge_get_position(dzlDockOverlayEdge);
	}

	/** */
	public void setEdge(GtkPositionType edge)
	{
		dzl_dock_overlay_edge_set_edge(dzlDockOverlayEdge, edge);
	}

	/** */
	public void setPosition(int position)
	{
		dzl_dock_overlay_edge_set_position(dzlDockOverlayEdge, position);
	}
}
