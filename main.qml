/*
 * Copyright (C) 2016 Florent Revest <revestflo@gmail.com>
 *               2015 Tim Süberkrüb <tim.sueberkrueb@web.de>
 * Part of this code is based on "Stopwatch" (https://github.com/baleboy/stopwatch)
 * Copyright (C) 2011 Francesco Balestrieri
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.9
import org.asteroid.controls 1.0
import Nemo.Configuration 1.0
import TwoFactor 1.0

Application {
    id: app

    centerColor: "#b01c7e"
    outerColor: "#420a2f"

    TwoFactor {
        id: twofactor
    }

    Item {
        id: mainPage
        anchors.fill: parent

        Label {
            id: codeLabel
            textFormat: Text.RichText
            anchors.centerIn: parent
            text: twofactor.getCode().toString().padStart(6, '0')
            font.pixelSize: Dims.h(15) // originally 25
            horizontalAlignment: Text.AlignHCenter
        }

    }

    Canvas {
        id: display
        anchors.fill: parent
        smooth: true
        renderStrategy: Canvas.Threaded
        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()
            ctx.shadowColor = (0, 0, 0, 0.25)
            ctx.shadowOffsetX = 0
            ctx.shadowOffsetY = 0
            ctx.shadowBlur = parent.height*0.00625
            ctx.lineCap="round"
            ctx.beginPath()
            var fraction_of_circle = (new Date().getSeconds() % 30) / 30
            var start_angle = -0.5*Math.PI
            var end_angle = start_angle + (2 * Math.PI * fraction_of_circle)
            ctx.arc(parent.width/2, parent.height/2, width / 2.2, start_angle-0.01, end_angle+0.01, true);
            ctx.lineWidth = parent.width * 0.01
            ctx.strokeStyle = Qt.rgba(1,1,1,0.5)
            ctx.stroke()
            if (fraction_of_circle === 0) { // update the code
                codeLabel.text = twofactor.getCode().toString().padStart(6, '0')
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            display.requestPaint()
        }
    }

}

