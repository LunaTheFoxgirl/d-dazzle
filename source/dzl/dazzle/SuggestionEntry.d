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
module dazzle.SuggestionEntry;

private import dazzle.Suggestion;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ListModelIF;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.CellEditableIF;
private import gtk.CellEditableT;
private import gtk.EditableIF;
private import gtk.EditableT;
private import gtk.Entry;
private import gtk.Widget;
private import std.algorithm;


/** */
public class SuggestionEntry : Entry
{
	/** the main Gtk struct */
	protected DzlSuggestionEntry* dzlSuggestionEntry;

	/** Get the main Gtk struct */
	public DzlSuggestionEntry* getSuggestionEntryStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlSuggestionEntry;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlSuggestionEntry;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlSuggestionEntry* dzlSuggestionEntry, bool ownedRef = false)
	{
		this.dzlSuggestionEntry = dzlSuggestionEntry;
		super(cast(GtkEntry*)dzlSuggestionEntry, ownedRef);
	}

	/** */
	public void defaultPositionFunc(GdkRectangle* area, bool* isAbsolute, void* userData)
	{
		dzl_suggestion_entry_default_position_func(dzlSuggestionEntry, area, cast(int*)&isAbsolute, userData);
	}

	/**
	 * This is a #DzlSuggestionPositionFunc that can be used to make the suggestion
	 * popover the full width of the window. It is similar to what you might find
	 * in a web browser.
	 */
	public void windowPositionFunc(GdkRectangle* area, bool* isAbsolute, void* userData)
	{
		dzl_suggestion_entry_window_position_func(dzlSuggestionEntry, area, cast(int*)&isAbsolute, userData);
	}


	/**
	 */

	/** */
	public static GType getType()
	{
		return dzl_suggestion_entry_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_suggestion_entry_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlSuggestionEntry*) p);
	}

	/** */
	public bool getActivateOnSingleClick()
	{
		return dzl_suggestion_entry_get_activate_on_single_click(dzlSuggestionEntry) != 0;
	}

	/**
	 * Gets the #DzlSuggestionEntry:compact property.
	 *
	 * Returns: %TRUE if compact-mode is in use.
	 *
	 * Since: 3.34
	 */
	public bool getCompact()
	{
		return dzl_suggestion_entry_get_compact(dzlSuggestionEntry) != 0;
	}

	/**
	 * Gets the model being visualized.
	 *
	 * Returns: A #GListModel or %NULL.
	 */
	public ListModelIF getModel()
	{
		auto p = dzl_suggestion_entry_get_model(dzlSuggestionEntry);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) p);
	}

	/**
	 * Gets the result display widget for the entry. This is currently
	 * always a #DzlSuggestionPopover.
	 *
	 * Returns: a #GtkWidget
	 *
	 * Since: 3.32
	 */
	public Widget getPopover()
	{
		auto p = dzl_suggestion_entry_get_popover(dzlSuggestionEntry);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Widget)(cast(GtkWidget*) p);
	}

	/**
	 * Gets the currently selected suggestion.
	 *
	 * Returns: An #DzlSuggestion or %NULL.
	 */
	public Suggestion getSuggestion()
	{
		auto p = dzl_suggestion_entry_get_suggestion(dzlSuggestionEntry);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Suggestion)(cast(DzlSuggestion*) p);
	}

	/** */
	public string getTypedText()
	{
		return Str.toString(dzl_suggestion_entry_get_typed_text(dzlSuggestionEntry));
	}

	/** */
	public void hideSuggestions()
	{
		dzl_suggestion_entry_hide_suggestions(dzlSuggestionEntry);
	}

	/** */
	public void setActivateOnSingleClick(bool activateOnSingleClick)
	{
		dzl_suggestion_entry_set_activate_on_single_click(dzlSuggestionEntry, activateOnSingleClick);
	}

	/**
	 * Sets the #DzlSuggestionEntry:compact property.
	 *
	 * Params:
	 *     compact = if compact mode should be used
	 *
	 * Since: 3.34
	 */
	public void setCompact(bool compact)
	{
		dzl_suggestion_entry_set_compact(dzlSuggestionEntry, compact);
	}

	/** */
	public void setModel(ListModelIF model)
	{
		dzl_suggestion_entry_set_model(dzlSuggestionEntry, (model is null) ? null : model.getListModelStruct());
	}

	/**
	 * Sets a position func to position the popover.
	 *
	 * In @func, you should set the height of the rectangle to the maximum height
	 * that the popover should be allowed to grow.
	 *
	 * Params:
	 *     func = A function to call to position the popover, or %NULL to set the default.
	 *     funcData = closure data for @func
	 *     funcDataDestroy = a destroy notify for @func_data
	 *
	 * Since: 3.26
	 */
	public void setPositionFunc(DzlSuggestionPositionFunc func, void* funcData, GDestroyNotify funcDataDestroy)
	{
		dzl_suggestion_entry_set_position_func(dzlSuggestionEntry, func, funcData, funcDataDestroy);
	}

	/** */
	public void setSuggestion(Suggestion suggestion)
	{
		dzl_suggestion_entry_set_suggestion(dzlSuggestionEntry, (suggestion is null) ? null : suggestion.getSuggestionStruct());
	}

	/** */
	gulong addOnAction(void delegate(string, string, string, SuggestionEntry) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "action", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnActivateSuggestion(void delegate(SuggestionEntry) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate-suggestion", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnHideSuggestions(void delegate(SuggestionEntry) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "hide-suggestions", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * This moves the selected suggestion in the popover by the value
	 * provided. -1 moves up one row, 1, moves down a row.
	 *
	 * Params:
	 *     amount = The number of items to move
	 */
	gulong addOnMoveSuggestion(void delegate(int, SuggestionEntry) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "move-suggestion", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnShowSuggestions(void delegate(SuggestionEntry) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "show-suggestions", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnSuggestionActivated(void delegate(Suggestion, SuggestionEntry) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "suggestion-activated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * This signal is emitted when a selection has been specifically selected
	 * by the user, such as by clicking on the row or moving to the row with
	 * keyboard, such as with #DzlSuggestionEntry::move-suggestion
	 *
	 * Params:
	 *     suggestion = a #DzlSuggestion
	 *
	 * Since: 3.30
	 */
	gulong addOnSuggestionSelected(void delegate(Suggestion, SuggestionEntry) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "suggestion-selected", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
