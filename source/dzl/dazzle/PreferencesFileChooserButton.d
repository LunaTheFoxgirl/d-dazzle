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
module dazzle.PreferencesFileChooserButton;

private import dazzle.PreferencesBin;
private import dazzle.c.functions;
public  import dazzle.c.types;


/** */
public class PreferencesFileChooserButton : PreferencesBin
{
	/** the main Gtk struct */
	protected DzlPreferencesFileChooserButton* dzlPreferencesFileChooserButton;

	/** Get the main Gtk struct */
	public DzlPreferencesFileChooserButton* getPreferencesFileChooserButtonStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return dzlPreferencesFileChooserButton;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)dzlPreferencesFileChooserButton;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (DzlPreferencesFileChooserButton* dzlPreferencesFileChooserButton, bool ownedRef = false)
	{
		this.dzlPreferencesFileChooserButton = dzlPreferencesFileChooserButton;
		super(cast(DzlPreferencesBin*)dzlPreferencesFileChooserButton, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return dzl_preferences_file_chooser_button_get_type();
	}
}
