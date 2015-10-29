# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import os
import sys

LOCAL_DIR = os.path.abspath(os.path.join(os.path.dirname(os.path.abspath(__file__)), '..'))
RELEASETOOLS_DIR = os.path.abspath(os.path.join(LOCAL_DIR, '../../../build/tools/releasetools'))

import edify_generator

class EdifyGenerator(object):
  """Class to generate scripts in the 'edify' recovery script language
  used from donut onwards."""

    def FlashBoot(self, partition):
	  """Flash a gs702a misc and boot section."""

      args = {'partition': partition}
      self.script.append(
          ('mount("vfat", "EMMC", "%(partition)s", "/misc");'
           'package_extract_dir("system/kernel/misc", "/misc");'
           'package_extract_file("boot.img", "/misc/boot.img");'
           'unmount("/misc");') % args)