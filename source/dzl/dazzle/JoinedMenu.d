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
module dazzle.JoinedMenu;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.MenuModel;
private import glib.ConstructionException;
private import gobject.ObjectG;


/** */
public class JoinedMenu : MenuModel
{
	/** the main Gtk struct */
	protected DzlJoinedMenu* dzlJoinedMenu;

	/** Get the main Gtk struct */
	public DzlJoinedMenu* getJoinedMenuStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlJoinedMenu;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlJoinedMenu;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlJoinedMenu* dzlJoinedMenu, bool ownedRef = false)
	{
		this.dzlJoinedMenu = dzlJoinedMenu;
		super(cast(GMenuModel*)dzlJoinedMenu, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_joined_menu_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_joined_menu_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlJoinedMenu*) p, true);
	}

	/** */
	public void appendMenu(MenuModel model)
	{
		dzl_joined_menu_append_menu(dzlJoinedMenu, (model is null) ? null : model.getMenuModelStruct());
	}

	/**
	 * Gets the number of joined menus.
	 */
	public uint getNJoined()
	{
		return dzl_joined_menu_get_n_joined(dzlJoinedMenu);
	}

	/** */
	public void prependMenu(MenuModel model)
	{
		dzl_joined_menu_prepend_menu(dzlJoinedMenu, (model is null) ? null : model.getMenuModelStruct());
	}

	/** */
	public void removeIndex(uint index)
	{
		dzl_joined_menu_remove_index(dzlJoinedMenu, index);
	}

	/** */
	public void removeMenu(MenuModel model)
	{
		dzl_joined_menu_remove_menu(dzlJoinedMenu, (model is null) ? null : model.getMenuModelStruct());
	}
}
