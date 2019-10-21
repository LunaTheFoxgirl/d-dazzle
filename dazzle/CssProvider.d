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
module dazzle.CssProvider;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gtk.CssProvider : GtkCssProv = CssProvider;
private import gtk.StyleProviderIF;
private import gtk.StyleProviderT;


/** */
public class CssProvider : GtkCssProv
{
	/** the main Gtk struct */
	protected DzlCssProvider* dzlCssProvider;

	/** Get the main Gtk struct */
	public DzlCssProvider* getDazzleCssProviderStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlCssProvider;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlCssProvider;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlCssProvider* dzlCssProvider, bool ownedRef = false)
	{
		this.dzlCssProvider = dzlCssProvider;
		super(cast(GtkCssProvider*)dzlCssProvider, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_css_provider_get_type();
	}

	/** */
	public this(string basePath)
	{
		auto p = dzl_css_provider_new(Str.toStringz(basePath));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlCssProvider*) p, true);
	}
}
