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
module dazzle.ThemeManager;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class ThemeManager : ObjectG
{
	/** the main Gtk struct */
	protected DzlThemeManager* dzlThemeManager;

	/** Get the main Gtk struct */
	public DzlThemeManager* getThemeManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlThemeManager;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlThemeManager;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlThemeManager* dzlThemeManager, bool ownedRef = false)
	{
		this.dzlThemeManager = dzlThemeManager;
		super(cast(GObject*)dzlThemeManager, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_theme_manager_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_theme_manager_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlThemeManager*) p, true);
	}

	/**
	 * This will automatically register resources found within @resource_path.
	 *
	 * If @resource_path starts with "resource://", embedded #GResources will be
	 * used to locate the theme files. Otherwise, @resource_path is expected to be
	 * a path on disk that may or may not exist.
	 *
	 * If the @resource_path contains a directory named "themes", that directory
	 * will be traversed for files matching the theme name and variant. For
	 * example, if using the Adwaita theme, "themes/Adwaita.css" will be loaded. If
	 * the dark variant is being used, "themes/Adwaita-dark.css" will be loaeded. If
	 * no matching theme file is located, "themes/shared.css" will be loaded.
	 *
	 * When the current theme changes, the CSS will be reloaded to adapt.
	 *
	 * The "icons" sub-directory will be used to locate icon themes.
	 *
	 * Params:
	 *     resourcePath = A path to a #GResources directory
	 */
	public void addResources(string resourcePath)
	{
		dzl_theme_manager_add_resources(dzlThemeManager, Str.toStringz(resourcePath));
	}

	/**
	 * This removes the CSS providers that were registered using @resource_path.
	 *
	 * You must have previously called dzl_theme_manager_add_resources() for
	 * this function to do anything.
	 *
	 * Since icons cannot be unloaded, previously loaded icons will continue to
	 * be available even after calling this function.
	 *
	 * Params:
	 *     resourcePath = A previously registered resources path
	 */
	public void removeResources(string resourcePath)
	{
		dzl_theme_manager_remove_resources(dzlThemeManager, Str.toStringz(resourcePath));
	}
}
