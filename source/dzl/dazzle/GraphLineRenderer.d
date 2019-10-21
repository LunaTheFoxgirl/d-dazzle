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
module dazzle.GraphLineRenderer;

private import dazzle.GraphRendererIF;
private import dazzle.GraphRendererT;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gdk.RGBA;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class GraphLineRenderer : ObjectG, GraphRendererIF
{
	/** the main Gtk struct */
	protected DzlGraphLineRenderer* dzlGraphLineRenderer;

	/** Get the main Gtk struct */
	public DzlGraphLineRenderer* getGraphLineRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlGraphLineRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlGraphLineRenderer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlGraphLineRenderer* dzlGraphLineRenderer, bool ownedRef = false)
	{
		this.dzlGraphLineRenderer = dzlGraphLineRenderer;
		super(cast(GObject*)dzlGraphLineRenderer, ownedRef);
	}

	// add the GraphRenderer capabilities
	mixin GraphRendererT!(DzlGraphLineRenderer);


	/** */
	public static GType getType()
	{
		return dzl_graph_view_line_renderer_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_graph_view_line_renderer_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlGraphLineRenderer*) p, true);
	}

	/** */
	public RGBA getStrokeColorRgba()
	{
		auto p = dzl_graph_view_line_renderer_get_stroke_color_rgba(dzlGraphLineRenderer);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(RGBA)(cast(GdkRGBA*) p);
	}

	/** */
	public void setStrokeColor(string strokeColor)
	{
		dzl_graph_view_line_renderer_set_stroke_color(dzlGraphLineRenderer, Str.toStringz(strokeColor));
	}

	/** */
	public void setStrokeColorRgba(RGBA strokeColorRgba)
	{
		dzl_graph_view_line_renderer_set_stroke_color_rgba(dzlGraphLineRenderer, (strokeColorRgba is null) ? null : strokeColorRgba.getRGBAStruct());
	}
}
