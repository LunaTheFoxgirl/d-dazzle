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
module dazzle.TabStrip;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.Box;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Stack;
private import gtk.Widget;


/** */
public class TabStrip : Box
{
	/** the main Gtk struct */
	protected DzlTabStrip* dzlTabStrip;

	/** Get the main Gtk struct */
	public DzlTabStrip* getTabStripStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlTabStrip;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlTabStrip;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlTabStrip* dzlTabStrip, bool ownedRef = false)
	{
		this.dzlTabStrip = dzlTabStrip;
		super(cast(GtkBox*)dzlTabStrip, ownedRef);
	}

	alias getStyle = Widget.getStyle;

	/** */
	public DzlTabStyle getStyle()
	{
		return dzl_tab_strip_get_style(dzlTabStrip);
	}

	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_tab_strip_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_tab_strip_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlTabStrip*) p);
	}

	/** */
	public void addControl(Widget widget)
	{
		dzl_tab_strip_add_control(dzlTabStrip, (widget is null) ? null : widget.getWidgetStruct());
	}

	/** */
	public GtkPositionType getEdge()
	{
		return dzl_tab_strip_get_edge(dzlTabStrip);
	}

	/**
	 * Returns: A #GtkStack or %NULL.
	 */
	public Stack getStack()
	{
		auto p = dzl_tab_strip_get_stack(dzlTabStrip);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Stack)(cast(GtkStack*) p);
	}

	/** */
	public void setEdge(GtkPositionType edge)
	{
		dzl_tab_strip_set_edge(dzlTabStrip, edge);
	}

	/** */
	public void setStack(Stack stack)
	{
		dzl_tab_strip_set_stack(dzlTabStrip, (stack is null) ? null : stack.getStackStruct());
	}

	/** */
	public void setStyle(DzlTabStyle style)
	{
		dzl_tab_strip_set_style(dzlTabStrip, style);
	}
}
