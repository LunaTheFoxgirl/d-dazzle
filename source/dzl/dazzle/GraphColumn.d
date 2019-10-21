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
module dazzle.GraphColumn;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class GraphColumn : ObjectG
{
	/** the main Gtk struct */
	protected DzlGraphColumn* dzlGraphColumn;

	/** Get the main Gtk struct */
	public DzlGraphColumn* getGraphColumnStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlGraphColumn;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlGraphColumn;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlGraphColumn* dzlGraphColumn, bool ownedRef = false)
	{
		this.dzlGraphColumn = dzlGraphColumn;
		super(cast(GObject*)dzlGraphColumn, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_graph_view_column_get_type();
	}

	/** */
	public this(string name, GType valueType)
	{
		auto p = dzl_graph_view_column_new(Str.toStringz(name), valueType);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlGraphColumn*) p, true);
	}

	/** */
	public string getName()
	{
		return Str.toString(dzl_graph_view_column_get_name(dzlGraphColumn));
	}

	/** */
	public void setName(string name)
	{
		dzl_graph_view_column_set_name(dzlGraphColumn, Str.toStringz(name));
	}
}
