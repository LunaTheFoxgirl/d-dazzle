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
module dazzle.SuggestionRow;

private import dazzle.ListBoxRow;
private import dazzle.Suggestion;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Widget;


/** */
public class SuggestionRow : ListBoxRow, OrientableIF
{
	/** the main Gtk struct */
	protected DzlSuggestionRow* dzlSuggestionRow;

	/** Get the main Gtk struct */
	public DzlSuggestionRow* getSuggestionRowStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlSuggestionRow;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlSuggestionRow;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlSuggestionRow* dzlSuggestionRow, bool ownedRef = false)
	{
		this.dzlSuggestionRow = dzlSuggestionRow;
		super(cast(DzlListBoxRow*)dzlSuggestionRow, ownedRef);
	}

	// add the Orientable capabilities
	mixin OrientableT!(DzlSuggestionRow);


	/** */
	public static GType getType()
	{
		return dzl_suggestion_row_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_suggestion_row_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlSuggestionRow*) p);
	}

	/**
	 * Gets the suggestion to be displayed.
	 *
	 * Returns: An #DzlSuggestion
	 */
	public Suggestion getSuggestion()
	{
		auto p = dzl_suggestion_row_get_suggestion(dzlSuggestionRow);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Suggestion)(cast(DzlSuggestion*) p);
	}

	/** */
	public void setSuggestion(Suggestion suggestion)
	{
		dzl_suggestion_row_set_suggestion(dzlSuggestionRow, (suggestion is null) ? null : suggestion.getSuggestionStruct());
	}
}
