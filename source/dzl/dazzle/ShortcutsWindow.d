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
module dazzle.ShortcutsWindow;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gobject.Signals;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Window;
private import std.algorithm;


/** */
public class ShortcutsWindow : Window
{
	/** the main Gtk struct */
	protected DzlShortcutsWindow* dzlShortcutsWindow;

	/** Get the main Gtk struct */
	public DzlShortcutsWindow* getShortcutsWindowStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutsWindow;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutsWindow;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutsWindow* dzlShortcutsWindow, bool ownedRef = false)
	{
		this.dzlShortcutsWindow = dzlShortcutsWindow;
		super(cast(GtkWindow*)dzlShortcutsWindow, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcuts_window_get_type();
	}

	/**
	 * The ::close signal is a
	 * [keybinding signal][GtkBindingSignal]
	 * which gets emitted when the user uses a keybinding to close
	 * the window.
	 *
	 * The default binding for this signal is the Escape key.
	 */
	gulong addOnClose(void delegate(ShortcutsWindow) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "close", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The ::search signal is a
	 * [keybinding signal][GtkBindingSignal]
	 * which gets emitted when the user uses a keybinding to start a search.
	 *
	 * The default binding for this signal is Control-F.
	 */
	gulong addOnSearch(void delegate(ShortcutsWindow) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "search", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
