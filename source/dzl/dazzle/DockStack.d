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
module dazzle.DockStack;

private import dazzle.DockItemIF;
private import dazzle.DockItemT;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Box;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Widget;


/** */
public class DockStack : Box, DockItemIF
{
	/** the main Gtk struct */
	protected DzlDockStack* dzlDockStack;

	/** Get the main Gtk struct */
	public DzlDockStack* getDockStackStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlDockStack;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlDockStack;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlDockStack* dzlDockStack, bool ownedRef = false)
	{
		this.dzlDockStack = dzlDockStack;
		super(cast(GtkBox*)dzlDockStack, ownedRef);
	}

	// add the DockItem capabilities
	mixin DockItemT!(DzlDockStack);

	alias getStyle = Widget.getStyle;

	/** */
	public DzlTabStyle getStyle()
	{
		return dzl_dock_stack_get_style(dzlDockStack);
	}
	alias getParent = Widget.getParent;
	alias getParent = Widget.getParent;

	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_dock_stack_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_dock_stack_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlDockStack*) p);
	}

	/** */
	public GtkPositionType getEdge()
	{
		return dzl_dock_stack_get_edge(dzlDockStack);
	}

	/** */
	public bool getShowPinnedButton()
	{
		return dzl_dock_stack_get_show_pinned_button(dzlDockStack) != 0;
	}

	/** */
	public void setEdge(GtkPositionType edge)
	{
		dzl_dock_stack_set_edge(dzlDockStack, edge);
	}

	/** */
	public void setShowPinnedButton(bool showPinnedButton)
	{
		dzl_dock_stack_set_show_pinned_button(dzlDockStack, showPinnedButton);
	}

	/** */
	public void setStyle(DzlTabStyle style)
	{
		dzl_dock_stack_set_style(dzlDockStack, style);
	}
}
