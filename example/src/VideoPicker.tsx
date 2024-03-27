import React, { type Dispatch, type SetStateAction } from 'react';
import {
  Button,
  Modal,
  SafeAreaView,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';

export const VIDEOS = [
  {
    source:
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    title: 'Big Buck Bunny',
  },
  {
    source:
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    title: 'Elephant Dream',
  },
  {
    source:
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
    title: 'Sintel',
  },
  {
    source:
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4',
    title: 'Subaru Outback On Street And Dirt',
  },
  {
    source:
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4',
    title: 'Tears of Steel',
  },
  {
    source:
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4',

    title: 'Volkswagen GTI Review',
  },
] as const;

export function VideoPicker({
  showVideoSelector,
  setShowVideoSelector,
  selectedVideo,
  setSelectedVideo,
}: {
  showVideoSelector: boolean;
  setShowVideoSelector: Dispatch<SetStateAction<boolean>>;
  selectedVideo: (typeof VIDEOS)[number];
  setSelectedVideo: Dispatch<SetStateAction<(typeof VIDEOS)[number]>>;
}) {
  return (
    <Modal
      animationType="slide"
      presentationStyle="pageSheet"
      visible={showVideoSelector}
    >
      <SafeAreaView
        style={{
          justifyContent: 'space-between',
          flex: 1,
        }}
      >
        <View
          style={{
            gap: 4,
            marginTop: 8,
          }}
        >
          {VIDEOS.map((video) => (
            <Item
              key={video.title}
              selected={video === selectedVideo}
              onPress={() => {
                setSelectedVideo(video);
                setShowVideoSelector(false);
              }}
              title={video.title}
            />
          ))}
        </View>
        <Button
          title="Close"
          color="red"
          onPress={() => setShowVideoSelector(false)}
        />
      </SafeAreaView>
    </Modal>
  );
}

function Item({
  selected,
  onPress,
  title,
}: {
  selected: boolean;
  onPress: () => void;
  title: string;
}) {
  return (
    <TouchableOpacity
      style={{
        flexDirection: 'row',
        paddingHorizontal: 8,
        alignItems: 'center',
      }}
      onPress={onPress}
    >
      <View
        style={{
          justifyContent: 'center',
          alignItems: 'center',
          borderRadius: 999,
          width: 20,
          height: 20,
          borderColor: 'black',
          borderWidth: 1,
          marginRight: 4,
        }}
      >
        {selected && (
          <View
            style={{
              width: 12,
              height: 12,
              borderRadius: 8,
              backgroundColor: 'black',
            }}
          />
        )}
      </View>
      <Text>{title}</Text>
    </TouchableOpacity>
  );
}
