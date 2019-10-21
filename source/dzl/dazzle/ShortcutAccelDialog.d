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
module dazzle.ShortcutAccelDialog;

private import dazzle.ShortcutChord;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Dialog;
private import gtk.Widget;


/** */
public class ShortcutAccelDialog : Dialog
{
	/** the main Gtk struct */
	protected DzlShortcutAccelDialog* dzlShortcutAccelDialog;

	/** Get the main Gtk struct */
	public DzlShortcutAccelDialog* getShortcutAccelDialogStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutAccelDialog;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutAccelDialog;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutAccelDialog* dzlShortcutAccelDialog, bool ownedRef = false)
	{
		this.dzlShortcutAccelDialog = dzlShortcutAccelDialog;
		super(cast(GtkDialog*)dzlShortcutAccelDialog, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcut_accel_dialog_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_shortcut_accel_dialog_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlShortcutAccelDialog*) p);
	}

	/** */
	public string getAccelerator()
	{
		auto retStr = dzl_shortcut_accel_dialog_get_accelerator(dzlShortcutAccelDialog);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/** */
	public ShortcutChord getChord()
	{
		auto p = dzl_shortcut_accel_dialog_get_chord(dzlShortcutAccelDialog);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutChord)(cast(DzlShortcutChord*) p);
	}

	/** */
	public string getShortcutTitle()
	{
		return Str.toString(dzl_shortcut_accel_dialog_get_shortcut_title(dzlShortcutAccelDialog));
	}

	/** */
	public void setAccelerator(string accelerator)
	{
		dzl_shortcut_accel_dialog_set_accelerator(dzlShortcutAccelDialog, Str.toStringz(accelerator));
	}

	/** */
	public void setShortcutTitle(string title)
	{
		dzl_shortcut_accel_dialog_set_shortcut_title(dzlShortcutAccelDialog, Str.toStringz(title));
	}
}
