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
module dazzle.SearchBar;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.SearchEntry;
private import gtk.Widget;
private import std.algorithm;


/** */
public class SearchBar : Bin
{
	/** the main Gtk struct */
	protected DzlSearchBar* dzlSearchBar;

	/** Get the main Gtk struct */
	public DzlSearchBar* getSearchBarStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlSearchBar;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlSearchBar;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlSearchBar* dzlSearchBar, bool ownedRef = false)
	{
		this.dzlSearchBar = dzlSearchBar;
		super(cast(GtkBin*)dzlSearchBar, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_search_bar_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_search_bar_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlSearchBar*) p);
	}

	/**
	 * Returns: A #GtkSearchEntry.
	 */
	public SearchEntry getEntry()
	{
		auto p = dzl_search_bar_get_entry(dzlSearchBar);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SearchEntry)(cast(GtkSearchEntry*) p);
	}

	/** */
	public bool getSearchModeEnabled()
	{
		return dzl_search_bar_get_search_mode_enabled(dzlSearchBar) != 0;
	}

	/** */
	public bool getShowCloseButton()
	{
		return dzl_search_bar_get_show_close_button(dzlSearchBar) != 0;
	}

	/** */
	public void setSearchModeEnabled(bool searchModeEnabled)
	{
		dzl_search_bar_set_search_mode_enabled(dzlSearchBar, searchModeEnabled);
	}

	/** */
	public void setShowCloseButton(bool showCloseButton)
	{
		dzl_search_bar_set_show_close_button(dzlSearchBar, showCloseButton);
	}

	/** */
	gulong addOnActivate(void delegate(SearchBar) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnReveal(void delegate(SearchBar) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "reveal", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
