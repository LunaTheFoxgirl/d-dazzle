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
module dazzle.BindingGroup;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.Closure;
private import gobject.ObjectG;


/**
 * #DzlBindingGroup manages to simplify the process of binding
 * many properties from a #GObject as a group. As such there is no API
 * to unbind a property from the group.
 * 
 * In particular, this allows you to change the source instance for the
 * bindings. This automatically causes the unbinding of the properties
 * from the old instance and binding to the new instance.
 * 
 * This should not be confused with #GtkBindingGroup.
 */
public class BindingGroup : ObjectG
{
	/** the main Gtk struct */
	protected DzlBindingGroup* dzlBindingGroup;

	/** Get the main Gtk struct */
	public DzlBindingGroup* getBindingGroupStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlBindingGroup;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlBindingGroup;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlBindingGroup* dzlBindingGroup, bool ownedRef = false)
	{
		this.dzlBindingGroup = dzlBindingGroup;
		super(cast(GObject*)dzlBindingGroup, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_binding_group_get_type();
	}

	/**
	 * Creates a new #DzlBindingGroup.
	 *
	 * Returns: a new #DzlBindingGroup
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = dzl_binding_group_new();

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlBindingGroup*) p, true);
	}

	/**
	 * Creates a binding between @source_property on the source object
	 * and @target_property on @target. Whenever the @source_property
	 * is changed the @target_property is updated using the same value.
	 * The binding flags #G_BINDING_SYNC_CREATE is automatically specified.
	 *
	 * See: g_object_bind_property().
	 *
	 * Params:
	 *     sourceProperty = the property on the source to bind
	 *     target = the target #GObject
	 *     targetProperty = the property on @target to bind
	 *     flags = the flags used to create the #GBinding
	 */
	public void bind(string sourceProperty, ObjectG target, string targetProperty, GBindingFlags flags)
	{
		dzl_binding_group_bind(dzlBindingGroup, Str.toStringz(sourceProperty), (target is null) ? null : target.getObjectGStruct(), Str.toStringz(targetProperty), flags);
	}

	/**
	 * Creates a binding between @source_property on the source object and
	 * @target_property on @target, allowing you to set the transformation
	 * functions to be used by the binding. The binding flags
	 * #G_BINDING_SYNC_CREATE is automatically specified.
	 *
	 * See: g_object_bind_property_full().
	 *
	 * Params:
	 *     sourceProperty = the property on the source to bind
	 *     target = the target #GObject
	 *     targetProperty = the property on @target to bind
	 *     flags = the flags used to create the #GBinding
	 *     transformTo = the transformation function
	 *         from the source object to the @target, or %NULL to use the default
	 *     transformFrom = the transformation function
	 *         from the @target to the source object, or %NULL to use the default
	 *     userData = custom data to be passed to the transformation
	 *         functions, or %NULL
	 *     userDataDestroy = function to be called when disposing the binding,
	 *         to free the resources used by the transformation functions
	 */
	public void bindFull(string sourceProperty, ObjectG target, string targetProperty, GBindingFlags flags, GBindingTransformFunc transformTo, GBindingTransformFunc transformFrom, void* userData, GDestroyNotify userDataDestroy)
	{
		dzl_binding_group_bind_full(dzlBindingGroup, Str.toStringz(sourceProperty), (target is null) ? null : target.getObjectGStruct(), Str.toStringz(targetProperty), flags, transformTo, transformFrom, userData, userDataDestroy);
	}

	/**
	 * Creates a binding between @source_property on the source object and
	 * @target_property on @target, allowing you to set the transformation
	 * functions to be used by the binding. The binding flags
	 * #G_BINDING_SYNC_CREATE is automatically specified.
	 *
	 * This function is the language bindings friendly version of
	 * dzl_binding_group_bind_property_full(), using #GClosures
	 * instead of function pointers.
	 *
	 * See: g_object_bind_property_with_closures().
	 *
	 * Params:
	 *     sourceProperty = the property on the source to bind
	 *     target = the target #GObject
	 *     targetProperty = the property on @target to bind
	 *     flags = the flags used to create the #GBinding
	 *     transformTo = a #GClosure wrapping the
	 *         transformation function from the source object to the @target,
	 *         or %NULL to use the default
	 *     transformFrom = a #GClosure wrapping the
	 *         transformation function from the @target to the source object,
	 *         or %NULL to use the default
	 */
	public void bindWithClosures(string sourceProperty, ObjectG target, string targetProperty, GBindingFlags flags, Closure transformTo, Closure transformFrom)
	{
		dzl_binding_group_bind_with_closures(dzlBindingGroup, Str.toStringz(sourceProperty), (target is null) ? null : target.getObjectGStruct(), Str.toStringz(targetProperty), flags, (transformTo is null) ? null : transformTo.getClosureStruct(), (transformFrom is null) ? null : transformFrom.getClosureStruct());
	}

	/**
	 * Gets the source object used for binding properties.
	 *
	 * Returns: the source object.
	 */
	public ObjectG getSource()
	{
		auto p = dzl_binding_group_get_source(dzlBindingGroup);

		if(p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ObjectG)(cast(GObject*) p);
	}

	/**
	 * Sets @source as the source object used for creating property
	 * bindings. If there is already a source object all bindings from it
	 * will be removed.
	 *
	 * Note: All properties that have been bound must exist on @source.
	 *
	 * Params:
	 *     source = the source #GObject
	 */
	public void setSource(ObjectG source)
	{
		dzl_binding_group_set_source(dzlBindingGroup, (source is null) ? null : source.getObjectGStruct());
	}
}
