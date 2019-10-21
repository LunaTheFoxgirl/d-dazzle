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
module dazzle.MenuButton;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.MenuModel;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.ActionableIF;
private import gtk.ActionableT;
private import gtk.ActivatableIF;
private import gtk.ActivatableT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.MenuButton : GtkMenuButtonEx = MenuButton;
private import gtk.Widget;


/** */
public class MenuButton : GtkMenuButtonEx
{
	/** the main Gtk struct */
	protected DzlMenuButton* dzlMenuButton;

	/** Get the main Gtk struct */
	public DzlMenuButton* getDazzleMenuButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlMenuButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlMenuButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlMenuButton* dzlMenuButton, bool ownedRef = false)
	{
		this.dzlMenuButton = dzlMenuButton;
		super(cast(GtkMenuButton*)dzlMenuButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_menu_button_get_type();
	}

	/**
	 * Creates a new #DzlMenuButton with the icon @icon_name and
	 * the menu contents of @model.
	 *
	 * Params:
	 *     iconName = An icon-name for the button
	 *     model = A #GMenuModel or %NULL
	 *
	 * Returns: A #DzlMenuButton
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string iconName, MenuModel model)
	{
		auto p = dzl_menu_button_new_with_model(Str.toStringz(iconName), (model is null) ? null : model.getMenuModelStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new_with_model");
		}

		this(cast(DzlMenuButton*) p, true);
	}

	/**
	 * Returns: A #DzlMenuButton or %NULL.
	 *
	 * Since: 3.26
	 */
	public MenuModel getModel()
	{
		auto p = dzl_menu_button_get_model(dzlMenuButton);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(MenuModel)(cast(GMenuModel*) p);
	}

	/** */
	public bool getShowAccels()
	{
		return dzl_menu_button_get_show_accels(dzlMenuButton) != 0;
	}

	/** */
	public bool getShowArrow()
	{
		return dzl_menu_button_get_show_arrow(dzlMenuButton) != 0;
	}

	/** */
	public bool getShowIcons()
	{
		return dzl_menu_button_get_show_icons(dzlMenuButton) != 0;
	}

	/** */
	public void setModel(MenuModel model)
	{
		dzl_menu_button_set_model(dzlMenuButton, (model is null) ? null : model.getMenuModelStruct());
	}

	/**
	 * Sets the #DzlMenuButton:show-accels property.
	 *
	 * If %TRUE, accelerators will be displayed next to menu items that
	 * contain a shortcut.
	 *
	 * Params:
	 *     showAccels = if accelerators should be visible
	 *
	 * Since: 3.26
	 */
	public void setShowAccels(bool showAccels)
	{
		dzl_menu_button_set_show_accels(dzlMenuButton, showAccels);
	}

	/**
	 * Sets the #DzlMenuButton:show-arrow property.
	 *
	 * If %TRUE, an pan-down-symbolic image will be displayed next to the
	 * image in the button.
	 *
	 * Since: 3.26
	 */
	public void setShowArrow(bool showArrow)
	{
		dzl_menu_button_set_show_arrow(dzlMenuButton, showArrow);
	}

	/**
	 * Sets the #DzlMenuButton:show-icons property.
	 *
	 * If %TRUE, icons will be displayed next to menu items that
	 * contain a shortcut.
	 *
	 * Params:
	 *     showIcons = if icons should be visible
	 *
	 * Since: 3.26
	 */
	public void setShowIcons(bool showIcons)
	{
		dzl_menu_button_set_show_icons(dzlMenuButton, showIcons);
	}
}
