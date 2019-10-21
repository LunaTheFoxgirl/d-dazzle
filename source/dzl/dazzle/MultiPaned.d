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
module dazzle.MultiPaned;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Container;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Widget;
private import std.algorithm;


/**
 * This widget is similar to #GtkPaned except that it allows adding more than
 * two children to the widget. For each additional child added to the
 * #DzlMultiPaned, an additional resize grip is added.
 */
public class MultiPaned : Container, OrientableIF
{
	/** the main Gtk struct */
	protected DzlMultiPaned* dzlMultiPaned;

	/** Get the main Gtk struct */
	public DzlMultiPaned* getMultiPanedStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlMultiPaned;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlMultiPaned;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlMultiPaned* dzlMultiPaned, bool ownedRef = false)
	{
		this.dzlMultiPaned = dzlMultiPaned;
		super(cast(GtkContainer*)dzlMultiPaned, ownedRef);
	}

	// add the Orientable capabilities
	mixin OrientableT!(DzlMultiPaned);


	/** */
	public static GType getType()
	{
		return dzl_multi_paned_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_multi_paned_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlMultiPaned*) p);
	}

	/**
	 * Locates the widget at position x,y within widget.
	 *
	 * @x and @y should be relative to @self.
	 *
	 * Params:
	 *     x = x coordinate
	 *     y = y coordinate
	 *
	 * Returns: a #GtkWidget or %NULL
	 *
	 * Since: 3.28
	 */
	public Widget getAtPoint(int x, int y)
	{
		auto p = dzl_multi_paned_get_at_point(dzlMultiPaned, x, y);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/** */
	public uint getNChildren()
	{
		return dzl_multi_paned_get_n_children(dzlMultiPaned);
	}

	/**
	 * Gets the @nth child of the #DzlMultiPaned.
	 *
	 * It is an error to call this function with a value >= the result of
	 * dzl_multi_paned_get_nth_child().
	 *
	 * The index starts from 0.
	 *
	 * Returns: A #GtkWidget
	 */
	public Widget getNthChild(uint nth)
	{
		auto p = dzl_multi_paned_get_nth_child(dzlMultiPaned, nth);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/** */
	gulong addOnResizeDragBegin(void delegate(Widget, MultiPaned) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "resize-drag-begin", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnResizeDragEnd(void delegate(Widget, MultiPaned) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "resize-drag-end", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
