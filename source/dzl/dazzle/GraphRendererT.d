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
module dazzle.GraphRendererT;

public  import cairo.Context;
public  import cairo.RectangleInt;
public  import dazzle.GraphModel;
public  import dazzle.c.functions;
public  import dazzle.c.types;


/** */
public template GraphRendererT(TStruct)
{
	/** Get the main Gtk struct */
	public DzlGraphRenderer* getGraphRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(DzlGraphRenderer*)getStruct();
	}

	/** */
	public void render(GraphModel table, long xBegin, long xEnd, double yBegin, double yEnd, Context cr, RectangleInt* area)
	{
		dzl_graph_view_renderer_render(getGraphRendererStruct(), (table is null) ? null : table.getGraphModelStruct(), xBegin, xEnd, yBegin, yEnd, (cr is null) ? null : cr.getContextStruct(), cast(cairo_rectangle_int_t*)area);
	}

	/**
	 */
}
