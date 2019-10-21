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
module dazzle.ShortcutModel;

private import dazzle.ShortcutChord;
private import dazzle.ShortcutManager;
private import dazzle.ShortcutTheme;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.TreeDragDestIF;
private import gtk.TreeDragDestT;
private import gtk.TreeDragSourceIF;
private import gtk.TreeDragSourceT;
private import gtk.TreeIter;
private import gtk.TreeModelIF;
private import gtk.TreeModelT;
private import gtk.TreeSortableIF;
private import gtk.TreeSortableT;
private import gtk.TreeStore;


/** */
public class ShortcutModel : TreeStore
{
	/** the main Gtk struct */
	protected DzlShortcutModel* dzlShortcutModel;

	/** Get the main Gtk struct */
	public DzlShortcutModel* getShortcutModelStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlShortcutModel;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlShortcutModel;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlShortcutModel* dzlShortcutModel, bool ownedRef = false)
	{
		this.dzlShortcutModel = dzlShortcutModel;
		super(cast(GtkTreeStore*)dzlShortcutModel, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_shortcut_model_get_type();
	}

	/**
	 * Returns: A #GtkTreeModel
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = dzl_shortcut_model_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlShortcutModel*) p, true);
	}

	/**
	 * Gets the manager to be edited.
	 *
	 * Returns: A #DzlShortcutManager
	 */
	public ShortcutManager getManager()
	{
		auto p = dzl_shortcut_model_get_manager(dzlShortcutModel);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutManager)(cast(DzlShortcutManager*) p);
	}

	/**
	 * Get the theme to be edited.
	 *
	 * Returns: A #DzlShortcutTheme
	 */
	public ShortcutTheme getTheme()
	{
		auto p = dzl_shortcut_model_get_theme(dzlShortcutModel);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutTheme)(cast(DzlShortcutTheme*) p);
	}

	/** */
	public void rebuild()
	{
		dzl_shortcut_model_rebuild(dzlShortcutModel);
	}

	/** */
	public void setChord(TreeIter iter, ShortcutChord chord)
	{
		dzl_shortcut_model_set_chord(dzlShortcutModel, (iter is null) ? null : iter.getTreeIterStruct(), (chord is null) ? null : chord.getShortcutChordStruct());
	}

	/** */
	public void setManager(ShortcutManager manager)
	{
		dzl_shortcut_model_set_manager(dzlShortcutModel, (manager is null) ? null : manager.getShortcutManagerStruct());
	}

	/** */
	public void setTheme(ShortcutTheme theme)
	{
		dzl_shortcut_model_set_theme(dzlShortcutModel, (theme is null) ? null : theme.getShortcutThemeStruct());
	}
}
