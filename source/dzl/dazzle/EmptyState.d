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
module dazzle.EmptyState;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Widget;


/** */
public class EmptyState : Bin
{
	/** the main Gtk struct */
	protected DzlEmptyState* dzlEmptyState;

	/** Get the main Gtk struct */
	public DzlEmptyState* getEmptyStateStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlEmptyState;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlEmptyState;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlEmptyState* dzlEmptyState, bool ownedRef = false)
	{
		this.dzlEmptyState = dzlEmptyState;
		super(cast(GtkBin*)dzlEmptyState, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_empty_state_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_empty_state_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlEmptyState*) p);
	}

	/** */
	public string getIconName()
	{
		return Str.toString(dzl_empty_state_get_icon_name(dzlEmptyState));
	}

	/** */
	public string getSubtitle()
	{
		return Str.toString(dzl_empty_state_get_subtitle(dzlEmptyState));
	}

	/** */
	public string getTitle()
	{
		return Str.toString(dzl_empty_state_get_title(dzlEmptyState));
	}

	/** */
	public void setIconName(string iconName)
	{
		dzl_empty_state_set_icon_name(dzlEmptyState, Str.toStringz(iconName));
	}

	/** */
	public void setResource(string resource)
	{
		dzl_empty_state_set_resource(dzlEmptyState, Str.toStringz(resource));
	}

	/** */
	public void setSubtitle(string title)
	{
		dzl_empty_state_set_subtitle(dzlEmptyState, Str.toStringz(title));
	}

	/** */
	public void setTitle(string title)
	{
		dzl_empty_state_set_title(dzlEmptyState, Str.toStringz(title));
	}
}
