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
module dazzle.DockBinEdge;

private import dazzle.DockItemIF;
private import dazzle.DockItemT;
private import dazzle.DockRevealer;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gobject.Signals;
private import gtk.Widget;
private import std.algorithm;


/** */
public class DockBinEdge : DockRevealer, DockItemIF
{
	/** the main Gtk struct */
	protected DzlDockBinEdge* dzlDockBinEdge;

	/** Get the main Gtk struct */
	public DzlDockBinEdge* getDockBinEdgeStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDockBinEdge;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDockBinEdge;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDockBinEdge* dzlDockBinEdge, bool ownedRef = false)
	{
		this.dzlDockBinEdge = dzlDockBinEdge;
		super(cast(DzlDockRevealer*)dzlDockBinEdge, ownedRef);
	}

	// add the DockItem capabilities
	mixin DockItemT!(DzlDockBinEdge);

	alias getParent = Widget.getParent;

	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_dock_bin_edge_get_type();
	}

	/** */
	public GtkPositionType getEdge()
	{
		return dzl_dock_bin_edge_get_edge(dzlDockBinEdge);
	}

	/** */
	gulong addOnMoveToBinChild(void delegate(DockBinEdge) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "move-to-bin-child", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
