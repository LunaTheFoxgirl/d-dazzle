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
module dazzle.Suggestion;

private import cairo.Surface;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.IconIF;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Widget;
private import std.algorithm;


/** */
public class Suggestion : ObjectG
{
	/** the main Gtk struct */
	protected DzlSuggestion* dzlSuggestion;

	/** Get the main Gtk struct */
	public DzlSuggestion* getSuggestionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlSuggestion;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlSuggestion;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlSuggestion* dzlSuggestion, bool ownedRef = false)
	{
		this.dzlSuggestion = dzlSuggestion;
		super(cast(GObject*)dzlSuggestion, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_suggestion_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_suggestion_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlSuggestion*) p, true);
	}

	/**
	 * Gets the icon for the suggestion, if any.
	 *
	 * Returns: a #GIcon or %NULL
	 *
	 * Since: 3.30
	 */
	public IconIF getIcon()
	{
		auto p = dzl_suggestion_get_icon(dzlSuggestion);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(IconIF)(cast(GIcon*) p, true);
	}

	/** */
	public string getIconName()
	{
		return Str.toString(dzl_suggestion_get_icon_name(dzlSuggestion));
	}

	/**
	 * This function allows subclasses to dynamicly generate content for the
	 * suggestion such as may be required when integrating with favicons or
	 * similar.
	 *
	 * @widget is provided so that the implementation may determine scale or
	 * any other style-specific settings from the style context.
	 *
	 * Params:
	 *     widget = a widget that may contain the surface
	 *
	 * Returns: a #cairo_surface_t or %NULL
	 *
	 * Since: 3.30
	 */
	public Surface getIconSurface(Widget widget)
	{
		auto p = dzl_suggestion_get_icon_surface(dzlSuggestion, (widget is null) ? null : widget.getWidgetStruct());

		if(p is null)
		{
			return null;
		}

		return new Surface(cast(cairo_surface_t*) p);
	}

	/** */
	public string getId()
	{
		return Str.toString(dzl_suggestion_get_id(dzlSuggestion));
	}

	/** */
	public string getSubtitle()
	{
		return Str.toString(dzl_suggestion_get_subtitle(dzlSuggestion));
	}

	/** */
	public string getTitle()
	{
		return Str.toString(dzl_suggestion_get_title(dzlSuggestion));
	}

	/**
	 * This function is meant to be used to replace the text in the entry with text
	 * that represents the suggestion most accurately. This happens when the user
	 * presses tab while typing a suggestion. For example, if typing "gno" in the
	 * entry, you might have a suggest_suffix of "me.org" so that the user sees
	 * "gnome.org". But the replace_typed_text might include more data such as
	 * "https://gnome.org" as it more closely represents the suggestion.
	 *
	 * Params:
	 *     typedText = the text that was typed into the entry
	 *
	 * Returns: The replacement text to insert into
	 *     the entry when "tab" is pressed to complete the insertion.
	 */
	public string replaceTypedText(string typedText)
	{
		auto retStr = dzl_suggestion_replace_typed_text(dzlSuggestion, Str.toStringz(typedText));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/** */
	public void setIconName(string iconName)
	{
		dzl_suggestion_set_icon_name(dzlSuggestion, Str.toStringz(iconName));
	}

	/** */
	public void setId(string id)
	{
		dzl_suggestion_set_id(dzlSuggestion, Str.toStringz(id));
	}

	/** */
	public void setSubtitle(string subtitle)
	{
		dzl_suggestion_set_subtitle(dzlSuggestion, Str.toStringz(subtitle));
	}

	/** */
	public void setTitle(string title)
	{
		dzl_suggestion_set_title(dzlSuggestion, Str.toStringz(title));
	}

	/**
	 * This function requests potential text to append to @typed_text to make it
	 * more clear to the user what they will be activating by selecting this
	 * suggestion. For example, if they start typing "gno", a potential suggested
	 * suffix might be "me.org" to create "gnome.org".
	 *
	 * Params:
	 *     typedText = The user entered text
	 *
	 * Returns: Suffix to append to @typed_text
	 *     or %NULL to leave it unchanged.
	 */
	public string suggestSuffix(string typedText)
	{
		auto retStr = dzl_suggestion_suggest_suffix(dzlSuggestion, Str.toStringz(typedText));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/** */
	gulong addOnReplaceTypedText(string delegate(string, Suggestion) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "replace-typed-text", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnSuggestSuffix(string delegate(string, Suggestion) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "suggest-suffix", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
