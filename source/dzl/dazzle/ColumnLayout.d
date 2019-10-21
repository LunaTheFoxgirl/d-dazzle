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
module dazzle.ColumnLayout;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Container;
private import gtk.Widget;


/** */
public class ColumnLayout : Container
{
	/** the main Gtk struct */
	protected DzlColumnLayout* dzlColumnLayout;

	/** Get the main Gtk struct */
	public DzlColumnLayout* getColumnLayoutStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlColumnLayout;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlColumnLayout;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlColumnLayout* dzlColumnLayout, bool ownedRef = false)
	{
		this.dzlColumnLayout = dzlColumnLayout;
		super(cast(GtkContainer*)dzlColumnLayout, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_column_layout_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_column_layout_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlColumnLayout*) p);
	}

	/** */
	public int getColumnSpacing()
	{
		return dzl_column_layout_get_column_spacing(dzlColumnLayout);
	}

	/** */
	public int getColumnWidth()
	{
		return dzl_column_layout_get_column_width(dzlColumnLayout);
	}

	/** */
	public uint getMaxColumns()
	{
		return dzl_column_layout_get_max_columns(dzlColumnLayout);
	}

	/** */
	public int getRowSpacing()
	{
		return dzl_column_layout_get_row_spacing(dzlColumnLayout);
	}

	/** */
	public void setColumnSpacing(int columnSpacing)
	{
		dzl_column_layout_set_column_spacing(dzlColumnLayout, columnSpacing);
	}

	/** */
	public void setColumnWidth(int columnWidth)
	{
		dzl_column_layout_set_column_width(dzlColumnLayout, columnWidth);
	}

	/** */
	public void setMaxColumns(uint maxColumns)
	{
		dzl_column_layout_set_max_columns(dzlColumnLayout, maxColumns);
	}

	/** */
	public void setRowSpacing(int rowSpacing)
	{
		dzl_column_layout_set_row_spacing(dzlColumnLayout, rowSpacing);
	}
}
