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
module dazzle.ShortcutLabel;

private import dazzle.ShortcutChord;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Box;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.OrientableIF;
private import gtk.OrientableT;
private import gtk.Widget;


/** */
public class ShortcutLabel : Box
{
	/** the main Gtk struct */
	protected DzlShortcutLabel* dzlShortcutLabel;

	/** Get the main Gtk struct */
	public DzlShortcutLabel* getShortcutLabelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutLabel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutLabel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutLabel* dzlShortcutLabel, bool ownedRef = false)
	{
		this.dzlShortcutLabel = dzlShortcutLabel;
		super(cast(GtkBox*)dzlShortcutLabel, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcut_label_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_shortcut_label_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlShortcutLabel*) p);
	}

	/** */
	public string getAccelerator()
	{
		auto retStr = dzl_shortcut_label_get_accelerator(dzlShortcutLabel);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * Gets the chord for the label, or %NULL.
	 *
	 * Returns: A #DzlShortcutChord or %NULL
	 */
	public ShortcutChord getChord()
	{
		auto p = dzl_shortcut_label_get_chord(dzlShortcutLabel);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutChord)(cast(DzlShortcutChord*) p);
	}

	/** */
	public void setAccelerator(string accelerator)
	{
		dzl_shortcut_label_set_accelerator(dzlShortcutLabel, Str.toStringz(accelerator));
	}

	/** */
	public void setChord(ShortcutChord chord)
	{
		dzl_shortcut_label_set_chord(dzlShortcutLabel, (chord is null) ? null : chord.getShortcutChordStruct());
	}
}
