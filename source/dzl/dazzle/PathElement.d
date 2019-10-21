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
module dazzle.PathElement;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class PathElement : ObjectG
{
	/** the main Gtk struct */
	protected DzlPathElement* dzlPathElement;

	/** Get the main Gtk struct */
	public DzlPathElement* getPathElementStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPathElement;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPathElement;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPathElement* dzlPathElement, bool ownedRef = false)
	{
		this.dzlPathElement = dzlPathElement;
		super(cast(GObject*)dzlPathElement, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_path_element_get_type();
	}

	/**
	 * Creates a new path element for an #DzlPath.
	 *
	 * Params:
	 *     id = An id for the path element.
	 *     iconName = An optional icon name for the element
	 *     title = The title of the element.
	 *
	 * Returns: A #DzlPathElement
	 *
	 * Since: 3.26
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string id, string iconName, string title)
	{
		auto p = dzl_path_element_new(Str.toStringz(id), Str.toStringz(iconName), Str.toStringz(title));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlPathElement*) p, true);
	}

	/**
	 * Gets the #DzlPathElement:icon-name property. This is used by the
	 * path bar to display an icon next to the element of the path.
	 *
	 * Returns: The icon-name for the #DzlPathElement.
	 *
	 * Since: 3.26
	 */
	public string getIconName()
	{
		return Str.toString(dzl_path_element_get_icon_name(dzlPathElement));
	}

	/**
	 * Gets the id for the element. Generally, a path is built of
	 * multiple elements and each element should have an id that
	 * is useful to the application that it using it. You might store
	 * the name of a directory, or some other key as the id.
	 *
	 * Returns: The id for the #DzlPathElement.
	 *
	 * Since: 3.26
	 */
	public string getId()
	{
		return Str.toString(dzl_path_element_get_id(dzlPathElement));
	}

	/**
	 * Gets the #DzlPathElement:title property. This is used by the
	 * path bar to display text representing the element of the path.
	 *
	 * Returns: The title for the #DzlPathElement.
	 *
	 * Since: 3.26
	 */
	public string getTitle()
	{
		return Str.toString(dzl_path_element_get_title(dzlPathElement));
	}
}
