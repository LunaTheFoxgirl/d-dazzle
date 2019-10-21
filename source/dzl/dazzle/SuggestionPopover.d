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
module dazzle.SuggestionPopover;

private import dazzle.Suggestion;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ListModelIF;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Widget;
private import gtk.Window;
private import std.algorithm;


/** */
public class SuggestionPopover : Window
{
	/** the main Gtk struct */
	protected DzlSuggestionPopover* dzlSuggestionPopover;

	/** Get the main Gtk struct */
	public DzlSuggestionPopover* getSuggestionPopoverStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlSuggestionPopover;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlSuggestionPopover;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlSuggestionPopover* dzlSuggestionPopover, bool ownedRef = false)
	{
		this.dzlSuggestionPopover = dzlSuggestionPopover;
		super(cast(GtkWindow*)dzlSuggestionPopover, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_suggestion_popover_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_suggestion_popover_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlSuggestionPopover*) p);
	}

	/** */
	public void activateSelected()
	{
		dzl_suggestion_popover_activate_selected(dzlSuggestionPopover);
	}

	/**
	 * Gets the model being visualized.
	 *
	 * Returns: A #GListModel or %NULL.
	 */
	public ListModelIF getModel()
	{
		auto p = dzl_suggestion_popover_get_model(dzlSuggestionPopover);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ListModelIF)(cast(GListModel*) p);
	}

	/**
	 * Returns: A #GtkWidget or %NULL.
	 */
	public Widget getRelativeTo()
	{
		auto p = dzl_suggestion_popover_get_relative_to(dzlSuggestionPopover);

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
	public Suggestion getSelected()
	{
		auto p = dzl_suggestion_popover_get_selected(dzlSuggestionPopover);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Suggestion)(cast(DzlSuggestion*) p);
	}

	/** */
	public void moveBy(int amount)
	{
		dzl_suggestion_popover_move_by(dzlSuggestionPopover, amount);
	}

	/** */
	public void popdown()
	{
		dzl_suggestion_popover_popdown(dzlSuggestionPopover);
	}

	/** */
	public void popup()
	{
		dzl_suggestion_popover_popup(dzlSuggestionPopover);
	}

	/** */
	public void setModel(ListModelIF model)
	{
		dzl_suggestion_popover_set_model(dzlSuggestionPopover, (model is null) ? null : model.getListModelStruct());
	}

	/** */
	public void setRelativeTo(Widget widget)
	{
		dzl_suggestion_popover_set_relative_to(dzlSuggestionPopover, (widget is null) ? null : widget.getWidgetStruct());
	}

	/** */
	public void setSelected(Suggestion suggestion)
	{
		dzl_suggestion_popover_set_selected(dzlSuggestionPopover, (suggestion is null) ? null : suggestion.getSuggestionStruct());
	}

	/** */
	gulong addOnSuggestionActivated(void delegate(Suggestion, SuggestionPopover) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "suggestion-activated", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
