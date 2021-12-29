

$(function () {
	window.addEventListener('message', function (event) {
		var beep = new Howl({src: ["https://www.rcpisawesome.co.uk/dev/FiveMRCPAxonCamera/beep.wav"]});
		beep.volume(0.01);
		switch (event.data.action) {
			case 'changeTime':
				$('#time').html(event.data.data)
				break;
			case 'changeJob':
				console.log(event.data.data)
				if (event.data.data == 'none') {
					$('body').css('display', 'none')
					beep.play();
				} else {
					$('body').css('display', 'unset')
					$('#job').html(event.data.data)
					beep.play();
				}
				break;
		}
	})
})