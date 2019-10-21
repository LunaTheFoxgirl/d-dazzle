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
module dazzle.PropertiesGroup;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.ActionGroupIF;
private import gio.ActionGroupT;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class PropertiesGroup : ObjectG, ActionGroupIF
{
	/** the main Gtk struct */
	protected DzlPropertiesGroup* dzlPropertiesGroup;

	/** Get the main Gtk struct */
	public DzlPropertiesGroup* getPropertiesGroupStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPropertiesGroup;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPropertiesGroup;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPropertiesGroup* dzlPropertiesGroup, bool ownedRef = false)
	{
		this.dzlPropertiesGroup = dzlPropertiesGroup;
		super(cast(GObject*)dzlPropertiesGroup, ownedRef);
	}

	// add the ActionGroup capabilities
	mixin ActionGroupT!(DzlPropertiesGroup);


	/** */
	public static GType getType()
	{
		return dzl_properties_group_get_type();
	}

	/**
	 * This creates a new #DzlPropertiesGroup to create stateful actions
	 * around properties in @object.
	 *
	 * Call dzl_properties_group_add_property() to add a property to
	 * action name mapping for this group. Until you've called this,
	 * no actions are mapped.
	 *
	 * Note that #DzlPropertiesGroup only holds a weak reference to
	 * @object and therefore you must keep @object alive elsewhere.
	 *
	 * Params:
	 *     object = The object containing the properties
	 *
	 * Returns: A #DzlPropertiesGroup
	 *
	 * Since: 3.26
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(ObjectG object)
	{
		auto p = dzl_properties_group_new((object is null) ? null : object.getObjectGStruct());

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlPropertiesGroup*) p, true);
	}

	/**
	 * This creates a new #DzlPropertiesGroup for which the initial object is
	 * %NULL.
	 *
	 * Set @object_type to a type of a class which is a #GObject-based type.
	 *
	 * Params:
	 *     objectType = A #GObjectClass based type
	 *
	 * Returns: A #DzlPropertiesGroup.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(GType objectType)
	{
		auto p = dzl_properties_group_new_for_type(objectType);

		if(p is null)
		{
			throw new ConstructionException("null returned by new_for_type");
		}

		this(cast(DzlPropertiesGroup*) p);
	}

	/**
	 * This function will try to add all properties found on the target
	 * instance to the group. Only properties that are supported by the
	 * #DzlPropertiesGroup will be added.
	 *
	 * The action name of all added properties will be identical to their
	 * property name.
	 *
	 * Since: 3.26
	 */
	public void addAllProperties()
	{
		dzl_properties_group_add_all_properties(dzlPropertiesGroup);
	}

	/**
	 * Adds a new stateful action named @name which maps to the underlying
	 * property @property_name of #DzlPropertiesGroup:object.
	 *
	 * Params:
	 *     name = the name of the action
	 *     propertyName = the name of the property
	 *
	 * Since: 3.26
	 */
	public void addProperty(string name, string propertyName)
	{
		dzl_properties_group_add_property(dzlPropertiesGroup, Str.toStringz(name), Str.toStringz(propertyName));
	}

	/**
	 * Adds a new stateful action named @name which maps to the underlying
	 * property @property_name of #DzlPropertiesGroup:object.
	 *
	 * Seting @flags allows you to tweak some settings about the action.
	 *
	 * Params:
	 *     name = the name of the action
	 *     propertyName = the name of the property
	 *     flags = optional flags for the action
	 *
	 * Since: 3.26
	 */
	public void addPropertyFull(string name, string propertyName, DzlPropertiesFlags flags)
	{
		dzl_properties_group_add_property_full(dzlPropertiesGroup, Str.toStringz(name), Str.toStringz(propertyName), flags);
	}

	/**
	 * Removes an action from @self that was previously added with
	 * dzl_properties_group_add_property(). @name should match the
	 * name parameter to that function.
	 *
	 * Params:
	 *     name = the name of the action
	 *
	 * Since: 3.26
	 */
	public void remove(string name)
	{
		dzl_properties_group_remove(dzlPropertiesGroup, Str.toStringz(name));
	}
}
