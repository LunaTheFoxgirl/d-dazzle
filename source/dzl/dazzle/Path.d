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
module dazzle.Path;

private import dazzle.PathElement;
private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Path : ObjectG
{
	/** the main Gtk struct */
	protected DzlPath* dzlPath;

	/** Get the main Gtk struct */
	public DzlPath* getPathStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPath;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPath;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPath* dzlPath, bool ownedRef = false)
	{
		this.dzlPath = dzlPath;
		super(cast(GObject*)dzlPath, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_path_get_type();
	}

	/** */
	public this()
	{
		auto p = dzl_path_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlPath*) p, true);
	}

	/** */
	public void append(PathElement element)
	{
		dzl_path_append(dzlPath, (element is null) ? null : element.getPathElementStruct());
	}

	/**
	 * Gets the path element found at @index.
	 *
	 * Indexes start from zero.
	 *
	 * Returns: An #DzlPathElement.
	 */
	public PathElement getElement(uint index)
	{
		auto p = dzl_path_get_element(dzlPath, index);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PathElement)(cast(DzlPathElement*) p);
	}

	/**
	 * Returns: The elements of the path.
	 */
	public ListG getElements()
	{
		auto p = dzl_path_get_elements(dzlPath);

		if(p is null)
		{
			return null;
		}

		return new ListG(cast(GList*) p);
	}

	/** */
	public uint getLength()
	{
		return dzl_path_get_length(dzlPath);
	}

	/** */
	public bool hasPrefix(Path prefix)
	{
		return dzl_path_has_prefix(dzlPath, (prefix is null) ? null : prefix.getPathStruct()) != 0;
	}

	/** */
	public bool isEmpty()
	{
		return dzl_path_is_empty(dzlPath) != 0;
	}

	/** */
	public void prepend(PathElement element)
	{
		dzl_path_prepend(dzlPath, (element is null) ? null : element.getPathElementStruct());
	}

	/** */
	public string printf()
	{
		auto retStr = dzl_path_printf(dzlPath);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}
}
