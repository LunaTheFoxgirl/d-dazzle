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
module dazzle.SimplePopover;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Popover;
private import gtk.Widget;
private import std.algorithm;


/** */
public class SimplePopover : Popover
{
	/** the main Gtk struct */
	protected DzlSimplePopover* dzlSimplePopover;

	/** Get the main Gtk struct */
	public DzlSimplePopover* getSimplePopoverStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlSimplePopover;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlSimplePopover;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlSimplePopover* dzlSimplePopover, bool ownedRef = false)
	{
		this.dzlSimplePopover = dzlSimplePopover;
		super(cast(GtkPopover*)dzlSimplePopover, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_simple_popover_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_simple_popover_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlSimplePopover*) p);
	}

	/** */
	public string getButtonText()
	{
		return Str.toString(dzl_simple_popover_get_button_text(dzlSimplePopover));
	}

	/** */
	public string getMessage()
	{
		return Str.toString(dzl_simple_popover_get_message(dzlSimplePopover));
	}

	/** */
	public bool getReady()
	{
		return dzl_simple_popover_get_ready(dzlSimplePopover) != 0;
	}

	/** */
	public string getText()
	{
		return Str.toString(dzl_simple_popover_get_text(dzlSimplePopover));
	}

	/** */
	public string getTitle()
	{
		return Str.toString(dzl_simple_popover_get_title(dzlSimplePopover));
	}

	/** */
	public void setButtonText(string buttonText)
	{
		dzl_simple_popover_set_button_text(dzlSimplePopover, Str.toStringz(buttonText));
	}

	/** */
	public void setMessage(string message)
	{
		dzl_simple_popover_set_message(dzlSimplePopover, Str.toStringz(message));
	}

	/** */
	public void setReady(bool ready)
	{
		dzl_simple_popover_set_ready(dzlSimplePopover, ready);
	}

	/** */
	public void setText(string text)
	{
		dzl_simple_popover_set_text(dzlSimplePopover, Str.toStringz(text));
	}

	/** */
	public void setTitle(string title)
	{
		dzl_simple_popover_set_title(dzlSimplePopover, Str.toStringz(title));
	}

	/**
	 * This signal is emitted when the popover's forward button is activated.
	 * Connect to this signal to perform your forward progress.
	 *
	 * Params:
	 *     text = The text at the time of activation.
	 */
	gulong addOnActivate(void delegate(string, SimplePopover) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * This signal is emitted when the entry text changes.
	 */
	gulong addOnChanged(void delegate(SimplePopover) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Use this signal to determine if text should be allowed to be inserted
	 * into the text buffer. Return GDK_EVENT_STOP to prevent the text from
	 * being inserted.
	 *
	 * Params:
	 *     position = the position in UTF-8 characters.
	 *     chars = the NULL terminated UTF-8 text to insert.
	 *     nChars = the number of UTF-8 characters in chars.
	 */
	gulong addOnInsertText(bool delegate(uint, string, uint, SimplePopover) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "insert-text", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
