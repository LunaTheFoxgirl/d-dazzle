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
module dazzle.ShortcutThemeEditor;

private import dazzle.ShortcutTheme;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.Bin;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.Widget;
private import std.algorithm;


/** */
public class ShortcutThemeEditor : Bin
{
	/** the main Gtk struct */
	protected DzlShortcutThemeEditor* dzlShortcutThemeEditor;

	/** Get the main Gtk struct */
	public DzlShortcutThemeEditor* getShortcutThemeEditorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutThemeEditor;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutThemeEditor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutThemeEditor* dzlShortcutThemeEditor, bool ownedRef = false)
	{
		this.dzlShortcutThemeEditor = dzlShortcutThemeEditor;
		super(cast(GtkBin*)dzlShortcutThemeEditor, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcut_theme_editor_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_shortcut_theme_editor_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlShortcutThemeEditor*) p);
	}

	/**
	 * Gets the shortcut theme if one hsa been set.
	 *
	 * Returns: An #DzlShortcutTheme or %NULL
	 */
	public ShortcutTheme getTheme()
	{
		auto p = dzl_shortcut_theme_editor_get_theme(dzlShortcutThemeEditor);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutTheme)(cast(DzlShortcutTheme*) p);
	}

	/** */
	public void setTheme(ShortcutTheme theme)
	{
		dzl_shortcut_theme_editor_set_theme(dzlShortcutThemeEditor, (theme is null) ? null : theme.getShortcutThemeStruct());
	}

	/**
	 * The "changed" signal is emitted when one of the rows within the editor
	 * has been changed.
	 *
	 * You might want to use this signal to save your theme changes to your
	 * configured storage backend.
	 */
	gulong addOnChanged(void delegate(ShortcutThemeEditor) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
