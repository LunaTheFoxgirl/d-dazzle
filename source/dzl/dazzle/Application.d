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
module dazzle.Application;

private import dazzle.MenuManager;
private import dazzle.ShortcutManager;
private import dazzle.ThemeManager;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.Menu;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.Application : GtkApp = Application;


/** */
public class Application : GtkApp
{
	/** the main Gtk struct */
	protected DzlApplication* dzlApplication;

	/** Get the main Gtk struct */
	public DzlApplication* getDazzleApplicationStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlApplication;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlApplication;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlApplication* dzlApplication, bool ownedRef = false)
	{
		this.dzlApplication = dzlApplication;
		super(cast(GtkApplication*)dzlApplication, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_application_get_type();
	}

	/** */
	public this(string applicationId, GApplicationFlags flags)
	{
		auto p = dzl_application_new(Str.toStringz(applicationId), flags);

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlApplication*) p, true);
	}

	/**
	 * This adds @resource_path to the list of "automatic resources".
	 *
	 * If @resource_path starts with "resource://", then the corresponding
	 * #GResources path will be searched for resources. Otherwise, @resource_path
	 * should be a path to a location on disk.
	 *
	 * The #DzlApplication will locate resources such as CSS themes, icons, and
	 * keyboard shortcuts using @resource_path.
	 *
	 * Params:
	 *     resourcePath = the location of the resources.
	 */
	public void addResources(string resourcePath)
	{
		dzl_application_add_resources(dzlApplication, Str.toStringz(resourcePath));
	}

	/**
	 * Similar to gtk_application_get_menu_by_id() but takes into account
	 * menu merging which could have occurred upon loading plugins.
	 *
	 * Params:
	 *     menuId = the id of the menu to locate
	 *
	 * Returns: A #GMenu
	 */
	public override Menu getMenuById(string menuId)
	{
		auto p = dzl_application_get_menu_by_id(dzlApplication, Str.toStringz(menuId));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Menu)(cast(GMenu*) p);
	}

	/**
	 * Gets the menu manager for the application.
	 *
	 * Returns: A #DzlMenuManager
	 */
	public MenuManager getMenuManager()
	{
		auto p = dzl_application_get_menu_manager(dzlApplication);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MenuManager)(cast(DzlMenuManager*) p);
	}

	/**
	 * Gets the #DzlShortcutManager for the application.
	 *
	 * Returns: A #DzlShortcutManager
	 */
	public ShortcutManager getShortcutManager()
	{
		auto p = dzl_application_get_shortcut_manager(dzlApplication);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ShortcutManager)(cast(DzlShortcutManager*) p);
	}

	/**
	 * Get the theme manager for the application.
	 *
	 * Returns: A #DzlThemeManager
	 */
	public ThemeManager getThemeManager()
	{
		auto p = dzl_application_get_theme_manager(dzlApplication);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ThemeManager)(cast(DzlThemeManager*) p);
	}

	/**
	 * This attempts to undo as many side-effects as possible from a call to
	 * dzl_application_add_resources().
	 *
	 * Params:
	 *     resourcePath = the location of the resources.
	 */
	public void removeResources(string resourcePath)
	{
		dzl_application_remove_resources(dzlApplication, Str.toStringz(resourcePath));
	}
}
