/*
 * Copyright (C) 2012 Actions-Semi, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef __ACT_DE_DRIVER__H__
#define __ACT_DE_DRIVER__H__

struct mdsb_info
{
    int drop_line_front;
    int drop_line_back;
    int xres;
    int yres;
};

// disp device type
enum disp_dev_id
{
    LCD_DISPLAYER = 0x1,
    HDMI_DISPLAYER = 0x2,
    TV_CVBS_DISPLAYER = 0x4,
    TV_YPbPr_DISPLAYER = 0x8,
    LCD_DISPLAYER_SECOND = 0x10,
    DSI_DISPLAYER = 0x20,
    DUMY_DISPLAYER = 0x8000,
};

#define MODE_DISP_SHIFT 0x00
#define MODE_DISP_MASK 0x07
#define MODE_DISP_SYNC_DEFAULT 0
#define MODE_DISP_DOUBLE_DEFAULT_NO_SYNC 1
#define MODE_DISP_DOUBLE_DEFAULT_SYNC 2
#define MODE_DISP_DOUBLE_DEFAULT_SYNC_EXT 3

#define MODE_OUT_MASK 0x0
#define MODE_OUT_SHIFT 0x04
#define MODE_OUT_TV_GV_LCD_GV 0
#define MODE_OUT_TV_GV_LCD_G 1
#define MODE_OUT_TV_V_LCD_G 2

#define MODE_DISP_SYNC_DEFAULT_TV_GV_LCD_GV (MODE_DISP_SYNC_DEFAULT | (MODE_OUT_TV_GV_LCD_GV << MODE_OUT_SHIFT))

#define MODE_DISP_DOUBLE_DEFAULT_NO_SYNC_TV_GV_LCD_GV (MODE_DISP_DOUBLE_DEFAULT_NO_SYNC | (MODE_OUT_TV_GV_LCD_GV << MODE_OUT_SHIFT))
#define MODE_DISP_DOUBLE_DEFAULT_NO_SYNC_TV_GV_LCD_G (MODE_DISP_DOUBLE_DEFAULT_NO_SYNC | (MODE_OUT_TV_GV_LCD_G << MODE_OUT_SHIFT))
#define MODE_DISP_DOUBLE_DEFAULT_NO_SYNC_TV_V_LCD_G (MODE_DISP_DOUBLE_DEFAULT_NO_SYNC | (MODE_OUT_TV_V_LCD_G << MODE_OUT_SHIFT))

#define MODE_DISP_DOUBLE_DEFAULT_SYNC_TV_GV_LCD_GV (MODE_DISP_DOUBLE_DEFAULT_SYNC | (MODE_OUT_TV_GV_LCD_GV << MODE_OUT_SHIFT))
#define MODE_DISP_DOUBLE_DEFAULT_SYNC_TV_GV_LCD_G (MODE_DISP_DOUBLE_DEFAULT_SYNC | (MODE_OUT_TV_GV_LCD_G << MODE_OUT_SHIFT))
#define MODE_DISP_DOUBLE_DEFAULT_SYNC_TV_V_LCD_G (MODE_DISP_DOUBLE_DEFAULT_SYNC | (MODE_OUT_TV_V_LCD_G << MODE_OUT_SHIFT))

#define MODE_DISP_DOUBLE_DEFAULT_SYNC_EXT_TV_GV_LCD_GV (MODE_DISP_DOUBLE_DEFAULT_SYNC_EXT | (MODE_OUT_TV_GV_LCD_GV << MODE_OUT_SHIFT))
#define MODE_DISP_DOUBLE_DEFAULT_SYNC_EXT_TV_GV_LCD_G (MODE_DISP_DOUBLE_DEFAULT_SYNC_EXT | (MODE_OUT_TV_GV_LCD_G << MODE_OUT_SHIFT))
#define MODE_DISP_DOUBLE_DEFAULT_SYNC_EXT_TV_V_LCD_G (MODE_DISP_DOUBLE_DEFAULT_SYNC_EXT | (MODE_OUT_TV_V_LCD_G << MODE_OUT_SHIFT))

#define DEIOSET_DISPLAYER 0x5702
#define DEIOGET_DISPLAYER 0x5703

#define DEIOSET_OVERLAY_STATUS 0x5704

#define DEIO_SELECT_AS_MAIN_FB 0x5705

#define DEIO_SET_SCALE_RATE_FULL_SCREEN 0x5706
#define DEIO_GET_SCALE_RATE_FULL_SCREEN 0x5707

#define DEIO_GET_DISP_CHANGED 0x5708

#define DEIO_GET_MDSB_INFO 0x5709

#define DEIO_GET_2X_MODE 0x5710
#define DEIO_SET_2X_MODE 0x5711

#define DEIO_GET_VIDEO_CHANGED 0x5712

#define DEIO_SET_DISP_MODE 0x5713


/*
 * ioctl DEIO_GET_NEXT_VSYNC & DEIO_WAIT_VSYNC
 * add for de vsync arch
 */
#define DEIO_GET_NEXT_VSYNC 0x5714
#define DEIO_WAIT_VSYNC 0x5715
#define DEIO_ENABLE_VSYNC 0x5716

/*
 * ioctl DEIO_IS_NEED_ROTATION
 * add for if lcd and hdmi xres and yres not fit ,then need rotation for hdmi 
 */
#define DEIO_IS_NEED_ROTATION 0x5717
#define DEIO_SET_NEED_ROTATION 0x5718

#define SCALE_ORIGINAL_SIZE 1
#define SCALE_FIT_SIZE 2
#define SCALE_FULL_SIZE 3
#define SCALE_CUSTOM_SCALE 4
#define SCALE_2X_MODE 5

/*
 * ioctl DEIO_POST_OVERLAY_INFO add for set de layer info from ioctl 
 */
#define DEIO_POST_OVERLAY_INFO 0x5719

struct overlay
{
    int layerId;
    bool enable;
    int isChanged;
    int iFenceID;
    int syncTimeLineFD;

	/* image informations */
    int imageW ;
    int imageH;
    int format;
    int physAddr;

    /* out put window informations */
    int posX ;
    int posY ;
    int posW ;
    int posH ;
    int rotation;
    int alpha;

    /* crop informations */
    int cropX;
    int cropY;
    int cropW;
    int cropH;
};

struct de_layers
{
    int layerNumber;
    struct overlay ovl[2];
};

#endif