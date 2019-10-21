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
module dazzle.SettingsSandwich;

private import dazzle.c.functions;
public  import dazzle.c.types;
private import gio.Settings;
private import glib.ConstructionException;
private import glib.Str;
private import glib.Variant;
private import gobject.ObjectG;


/** */
public class SettingsSandwich : ObjectG
{
	/** the main Gtk struct */
	protected DzlSettingsSandwich* dzlSettingsSandwich;

	/** Get the main Gtk struct */
	public DzlSettingsSandwich* getSettingsSandwichStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlSettingsSandwich;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlSettingsSandwich;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlSettingsSandwich* dzlSettingsSandwich, bool ownedRef = false)
	{
		this.dzlSettingsSandwich = dzlSettingsSandwich;
		super(cast(GObject*)dzlSettingsSandwich, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_settings_sandwich_get_type();
	}

	/** */
	public this(string schemaId, string path)
	{
		auto p = dzl_settings_sandwich_new(Str.toStringz(schemaId), Str.toStringz(path));

		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(DzlSettingsSandwich*) p, true);
	}

	/** */
	public void append(Settings settings)
	{
		dzl_settings_sandwich_append(dzlSettingsSandwich, (settings is null) ? null : settings.getSettingsStruct());
	}

	/** */
	public void bind(string key, void* object, string property, GSettingsBindFlags flags)
	{
		dzl_settings_sandwich_bind(dzlSettingsSandwich, Str.toStringz(key), object, Str.toStringz(property), flags);
	}

	/**
	 * Creates a new binding similar to g_settings_bind_with_mapping() but applying
	 * from the resolved value via the settings sandwich.
	 *
	 * Params:
	 *     key = the settings key to bind.
	 *         @object (type GObject.Object): the target object.
	 *     property = the property on @object to apply.
	 *     flags = flags for the binding.
	 *     getMapping = the get mapping function
	 *     setMapping = the set mapping function
	 *     userData = user data for @get_mapping and @set_mapping.
	 *     destroy = destroy notify for @user_data.
	 */
	public void bindWithMapping(string key, void* object, string property, GSettingsBindFlags flags, GSettingsBindGetMapping getMapping, GSettingsBindSetMapping setMapping, void* userData, GDestroyNotify destroy)
	{
		dzl_settings_sandwich_bind_with_mapping(dzlSettingsSandwich, Str.toStringz(key), object, Str.toStringz(property), flags, getMapping, setMapping, userData, destroy);
	}

	/** */
	public bool getBoolean(string key)
	{
		return dzl_settings_sandwich_get_boolean(dzlSettingsSandwich, Str.toStringz(key)) != 0;
	}

	/** */
	public Variant getDefaultValue(string key)
	{
		auto p = dzl_settings_sandwich_get_default_value(dzlSettingsSandwich, Str.toStringz(key));

		if(p is null)
		{
			return null;
		}

		return new Variant(cast(GVariant*) p, true);
	}

	/** */
	public double getDouble(string key)
	{
		return dzl_settings_sandwich_get_double(dzlSettingsSandwich, Str.toStringz(key));
	}

	/** */
	public int getInt(string key)
	{
		return dzl_settings_sandwich_get_int(dzlSettingsSandwich, Str.toStringz(key));
	}

	/** */
	public string getString(string key)
	{
		auto retStr = dzl_settings_sandwich_get_string(dzlSettingsSandwich, Str.toStringz(key));

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/** */
	public uint getUint(string key)
	{
		return dzl_settings_sandwich_get_uint(dzlSettingsSandwich, Str.toStringz(key));
	}

	/** */
	public Variant getUserValue(string key)
	{
		auto p = dzl_settings_sandwich_get_user_value(dzlSettingsSandwich, Str.toStringz(key));

		if(p is null)
		{
			return null;
		}

		return new Variant(cast(GVariant*) p, true);
	}

	/** */
	public Variant getValue(string key)
	{
		auto p = dzl_settings_sandwich_get_value(dzlSettingsSandwich, Str.toStringz(key));

		if(p is null)
		{
			return null;
		}

		return new Variant(cast(GVariant*) p, true);
	}

	/** */
	public void setBoolean(string key, bool val)
	{
		dzl_settings_sandwich_set_boolean(dzlSettingsSandwich, Str.toStringz(key), val);
	}

	/** */
	public void setDouble(string key, double val)
	{
		dzl_settings_sandwich_set_double(dzlSettingsSandwich, Str.toStringz(key), val);
	}

	/** */
	public void setInt(string key, int val)
	{
		dzl_settings_sandwich_set_int(dzlSettingsSandwich, Str.toStringz(key), val);
	}

	/** */
	public void setString(string key, string val)
	{
		dzl_settings_sandwich_set_string(dzlSettingsSandwich, Str.toStringz(key), Str.toStringz(val));
	}

	/** */
	public void setUint(string key, uint val)
	{
		dzl_settings_sandwich_set_uint(dzlSettingsSandwich, Str.toStringz(key), val);
	}

	/** */
	public void setValue(string key, Variant value)
	{
		dzl_settings_sandwich_set_value(dzlSettingsSandwich, Str.toStringz(key), (value is null) ? null : value.getVariantStruct());
	}

	/** */
	public void unbind(string property)
	{
		dzl_settings_sandwich_unbind(dzlSettingsSandwich, Str.toStringz(property));
	}
}
