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
module dazzle.GraphModel;

private import dazzle.GraphColumn;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gobject.Value;
private import std.algorithm;


/** */
public class GraphModel : ObjectG
{
	/** the main Gtk struct */
	protected DzlGraphModel* dzlGraphModel;

	/** Get the main Gtk struct */
	public DzlGraphModel* getGraphModelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlGraphModel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlGraphModel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlGraphModel* dzlGraphModel, bool ownedRef = false)
	{
		this.dzlGraphModel = dzlGraphModel;
		super(cast(GObject*)dzlGraphModel, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_graph_view_model_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_graph_view_model_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlGraphModel*) p, true);
	}

	/** */
	public static long iterGetTimestamp(DzlGraphModelIter* iter)
	{
		return dzl_graph_view_model_iter_get_timestamp(iter);
	}

	/** */
	public static void iterGetValue(DzlGraphModelIter* iter, uint column, Value value)
	{
		dzl_graph_view_model_iter_get_value(iter, column, (value is null) ? null : value.getValueStruct());
	}

	/** */
	public static bool iterNext(DzlGraphModelIter* iter)
	{
		return dzl_graph_view_model_iter_next(iter) != 0;
	}

	/**
	 * Sets an individual value within a specific column.
	 *
	 * Params:
	 *     iter = the iter to set
	 *     column = the column to set
	 *     value = the new value for the column
	 *
	 * Since: 3.30
	 */
	public static void iterSetValue(DzlGraphModelIter* iter, uint column, Value value)
	{
		dzl_graph_view_model_iter_set_value(iter, column, (value is null) ? null : value.getValueStruct());
	}

	/** */
	public uint addColumn(GraphColumn column)
	{
		return dzl_graph_view_model_add_column(dzlGraphModel, (column is null) ? null : column.getGraphColumnStruct());
	}

	/** */
	public long getEndTime()
	{
		return dzl_graph_view_model_get_end_time(dzlGraphModel);
	}

	/** */
	public bool getIterFirst(DzlGraphModelIter* iter)
	{
		return dzl_graph_view_model_get_iter_first(dzlGraphModel, iter) != 0;
	}

	/** */
	public bool getIterLast(DzlGraphModelIter* iter)
	{
		return dzl_graph_view_model_get_iter_last(dzlGraphModel, iter) != 0;
	}

	/** */
	public uint getMaxSamples()
	{
		return dzl_graph_view_model_get_max_samples(dzlGraphModel);
	}

	/** */
	public uint getNColumns()
	{
		return dzl_graph_view_model_get_n_columns(dzlGraphModel);
	}

	/** */
	public GTimeSpan getTimespan()
	{
		return dzl_graph_view_model_get_timespan(dzlGraphModel);
	}

	/** */
	public void push(out DzlGraphModelIter iter, long timestamp)
	{
		dzl_graph_view_model_push(dzlGraphModel, &iter, timestamp);
	}

	/** */
	public void setMaxSamples(uint nRows)
	{
		dzl_graph_view_model_set_max_samples(dzlGraphModel, nRows);
	}

	/** */
	public void setTimespan(GTimeSpan timespan)
	{
		dzl_graph_view_model_set_timespan(dzlGraphModel, timespan);
	}

	/** */
	gulong addOnChanged(void delegate(GraphModel) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
