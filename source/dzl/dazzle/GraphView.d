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
module dazzle.GraphView;

private import dazzle.GraphModel;
private import dazzle.GraphRendererIF;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.DrawingArea;
private import gtk.Widget;


/** */
public class GraphView : DrawingArea
{
	/** the main Gtk struct */
	protected DzlGraphView* dzlGraphView;

	/** Get the main Gtk struct */
	public DzlGraphView* getGraphViewStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlGraphView;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlGraphView;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlGraphView* dzlGraphView, bool ownedRef = false)
	{
		this.dzlGraphView = dzlGraphView;
		super(cast(GtkDrawingArea*)dzlGraphView, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_graph_view_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_graph_view_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlGraphView*) p);
	}

	/** */
	public void addRenderer(GraphRendererIF renderer)
	{
		dzl_graph_view_add_renderer(dzlGraphView, (renderer is null) ? null : renderer.getGraphRendererStruct());
	}

	/**
	 * Gets the #DzlGraphView:model property.
	 *
	 * Returns: An #DzlGraphModel or %NULL.
	 */
	public GraphModel getModel()
	{
		auto p = dzl_graph_view_get_model(dzlGraphView);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(GraphModel)(cast(DzlGraphModel*) p);
	}

	/** */
	public void setModel(GraphModel model)
	{
		dzl_graph_view_set_model(dzlGraphView, (model is null) ? null : model.getGraphModelStruct());
	}
}
