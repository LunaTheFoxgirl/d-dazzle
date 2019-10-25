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
module dazzle.ThreeGrid;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Container;
private import gtk.Widget;


/** */
public class ThreeGrid : Container
{
	/** the main Gtk struct */
	protected DzlThreeGrid* dzlThreeGrid;

	/** Get the main Gtk struct */
	public DzlThreeGrid* getThreeGridStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlThreeGrid;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlThreeGrid;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlThreeGrid* dzlThreeGrid, bool ownedRef = false)
	{
		this.dzlThreeGrid = dzlThreeGrid;
		super(cast(GtkContainer*)dzlThreeGrid, ownedRef);
	}


	/**
	Adds a widget to the grid at the row and column
	(Helper function)
	 */
	public void addAt(Widget widget, uint row, uint column) {
		this.add(widget);
		moveChild(widget, row, column);
	}

	/**
	Moves a widget on the grid from one row/column pair to an other
	(Helper function)
	 */
	public void moveChild(Widget widget, uint row, uint column) {
		import gobject.Value : Value;
		this.childSetProperty(widget, "row", new Value(row));
		this.childSetProperty(widget, "column", new Value(column));
	}

	/**
	Sets the column spacing
	 */
	public void setColumnSpacing(uint spacing) {
		setProperty("column-spacing", spacing);
	}

	/**
	Sets the column spacing
	 */
	public uint getColumnSpacing() {
		Value val = new Value();
		getProperty("column-spacing", val);
		return val.get!uint;
	}

	/**
	Sets the row spacing
	 */
	public void setRowSpacing(uint spacing) {
		setProperty("row-spacing", spacing);
	}

	/**
	Sets the row spacing
	 */
	public uint getRowSpacing() {
		Value val = new Value();
		getProperty("row-spacing", val);
		return val.get!uint;
	}


	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_three_grid_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_three_grid_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlThreeGrid*) p);
	}
}
