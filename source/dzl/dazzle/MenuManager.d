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
module dazzle.MenuManager;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.Menu;
private import gio.MenuModel;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.Str;
private import gobject.ObjectG;


/**
 * The goal of #DzlMenuManager is to simplify the process of merging multiple
 * GtkBuilder .ui files containing menus into a single representation of the
 * application menus. Additionally, it provides the ability to "unmerge"
 * previously merged menus.
 * 
 * This allows for an application to have plugins which seemlessly extends
 * the core application menus.
 * 
 * Implementation notes:
 * 
 * To make this work, we don't use the GMenu instances created by a GtkBuilder
 * instance. Instead, we create the menus ourself and recreate section and
 * submenu links. This allows the #DzlMenuManager to be in full control of
 * the generated menus.
 * 
 * dzl_menu_manager_get_menu_by_id() will always return a #GMenu, however
 * that menu may contain no children until something has extended it later
 * on during the application process.
 *
 * Since: 3.26
 */
public class MenuManager : ObjectG
{
	/** the main Gtk struct */
	protected DzlMenuManager* dzlMenuManager;

	/** Get the main Gtk struct */
	public DzlMenuManager* getMenuManagerStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlMenuManager;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlMenuManager;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlMenuManager* dzlMenuManager, bool ownedRef = false)
	{
		this.dzlMenuManager = dzlMenuManager;
		super(cast(GObject*)dzlMenuManager, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_menu_manager_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_menu_manager_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlMenuManager*) p, true);
	}

	/** */
	public uint addFilename(string filename)
	{
		GError* err = null;

		auto p = dzl_menu_manager_add_filename(dzlMenuManager, Str.toStringz(filename), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/** */
	public uint addResource(string resource)
	{
		GError* err = null;

		auto p = dzl_menu_manager_add_resource(dzlMenuManager, Str.toStringz(resource), &err);

		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}

		return p;
	}

	/**
	 * Returns: A #GMenu.
	 */
	public Menu getMenuById(string menuId)
	{
		auto p = dzl_menu_manager_get_menu_by_id(dzlMenuManager, Str.toStringz(menuId));

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Menu)(cast(GMenu*) p);
	}

	/** */
	public uint merge(string menuId, MenuModel model)
	{
		return dzl_menu_manager_merge(dzlMenuManager, Str.toStringz(menuId), (model is null) ? null : model.getMenuModelStruct());
	}

	/**
	 * This removes items from menus that were added as part of a previous
	 * menu merge. Use the value returned from dzl_menu_manager_merge() as
	 * the @merge_id.
	 *
	 * Params:
	 *     mergeId = A previously registered merge id
	 *
	 * Since: 3.26
	 */
	public void remove(uint mergeId)
	{
		dzl_menu_manager_remove(dzlMenuManager, mergeId);
	}
}
